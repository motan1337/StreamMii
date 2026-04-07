#!/usr/bin/env bash
set -euo pipefail

#  If not runned as root ask for root 
if [[ $EUID -ne 0 ]]; then
    echo "[!] Requesting root privileges..."
    exec sudo bash "$0" "$@"
fi

#  Detecting pkg mng
detect_pkg_manager() {
    if   command -v apt-get &>/dev/null; then echo "apt"
    elif command -v dnf     &>/dev/null; then echo "dnf"
    elif command -v yum     &>/dev/null; then echo "yum"
    elif command -v pacman  &>/dev/null; then echo "pacman"
    elif command -v zypper  &>/dev/null; then echo "zypper"
    elif command -v apk     &>/dev/null; then echo "apk"
    else
        echo "[X] No supported package manager found." >&2
        exit 1
    fi
}

PKG_MGR=$(detect_pkg_manager)
echo "[!] Detected package manager: $PKG_MGR"

pkg_update() {
    case "$PKG_MGR" in
        apt)     apt-get update -qq ;;
        dnf|yum) "$PKG_MGR" check-update -q || true ;;
        pacman)  pacman -Sy --noconfirm ;;
        zypper)  zypper refresh ;;
        apk)     apk update ;;
    esac
}

pkg_install() {
    case "$PKG_MGR" in
        apt)     apt-get install -y "$@" ;;
        dnf|yum) "$PKG_MGR" install -y "$@" ;;
        pacman)  pacman -S --noconfirm "$@" ;;
        zypper)  zypper install -y "$@" ;;
        apk)     apk add --no-cache "$@" ;;
    esac
}

#  Updating and installing python
echo
echo "[!] Updating package lists..."
pkg_update

echo "[!] Installing Python 3 + pip..."
case "$PKG_MGR" in
    apt)     pkg_install python3 python3-pip python3-venv ;;
    dnf|yum) pkg_install python3 python3-pip ;;
    pacman)  pkg_install python python-pip ;;
    zypper)  pkg_install python3 python3-pip ;;
    apk)     pkg_install python3 py3-pip ;;
esac

# Resolves python binary name varies by distros
if   command -v python3 &>/dev/null; then PYTHON_EXE=python3
elif command -v python  &>/dev/null; then PYTHON_EXE=python
else
    echo "[X] Python not found after install." >&2
    exit 1
fi
echo "[!] Using Python: $PYTHON_EXE ($($PYTHON_EXE --version 2>&1))"

#  Updating pip and install pip
echo "[!] Upgrading pip..."
$PYTHON_EXE -m pip install --upgrade pip

echo "[!] Installing Python packages..."
$PYTHON_EXE -m pip install \
    "requests>=2.31.0" \
    "guessit>=3.2.0"   \
    "colorama>=0.4.6"

#  Install ffmpeg 
#  Replaces: choco install ffmpeg-full
#  On Fedora/RHEL full ffmpeg needs rpm fusion
echo
echo "[!] Installing FFmpeg..."
case "$PKG_MGR" in
    apt)
        pkg_install ffmpeg
        ;;
    dnf)
        if ! rpm -q rpmfusion-free-release &>/dev/null; then
            echo "[!] Enabling RPM Fusion (free) for full FFmpeg codec support..."
            dnf install -y \
                "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
                || true
        fi
        pkg_install ffmpeg
        ;;
    yum)  pkg_install ffmpeg ;;
    pacman) pkg_install ffmpeg ;;
    zypper) pkg_install ffmpeg ;;
    apk)    pkg_install ffmpeg ;;
esac

echo
echo "════════════════ VERIFICATION ════════════════"

echo
echo "▸ Python:"
$PYTHON_EXE --version

echo
echo "▸ Pip packages:"
for pkg in requests guessit colorama; do
    $PYTHON_EXE -m pip show "$pkg" 2>/dev/null | grep -E "^(Name|Version)" || \
        echo "  [X] $pkg — not found"
done

echo
echo "▸ FFmpeg:"
ffmpeg -version 2>&1 | head -1

echo
echo "════════════════ ALL DONE! ════════════════"
read -rp "Press Enter to exit..."