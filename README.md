A fork from my friend phmn (TwinkPad). Why did I fork it? Well I did not want to interfer with his work with my changes and work so I forked it to apply my changes and optimizations.

# StreamMii

A simple tool that converts media into Wii compatible formats for smooth playback.

---

## 🚀 Features

* **GPU Acceleration Support:**
    * **AMD**
    * **NVIDIA** (NVENC)
    * **Intel** (QSV)
    * **CPU fallback** (not recommended due to lower quality & performance)
* **Automatic media metadata handling**
---

## 🛠️ Output Settings

| Parameter | Configuration |
| :--- | :--- |
| **Resolution** | 640x360 or 640x480 depending on aspect ratio |
| **Scaling** | Lanczos resampling |
| **Bitrate** | 1000 kbps |
| **FPS** | **Usually** matches source media |

---

## 📁 Supported Media Types

* Movies
* TV Shows
* <details>
  <summary>Adult Content </summary>

  Solo, Group, JAV

  </details>
* Audio
* Documentaries
* K-Drama
* Anime
* <details>
  <summary>Sports </summary>

  Team Sports > Football, Basketball, Volleyball, Rugby, Baseball, Softball, Handball  
  Combat Sports > Boxing, MMA, Wrestling, Karate  
  Winter Sports > Skiing, Snowboarding, Ice Skating, Bobsledding  
  Water Sports > Surfing, Rowing, Kayaking, Synchronized Swimming  
  Motor Sports > F1, MotoGP  
  Individual Sports > Athletics (Track and Field), Tennis, Golf, Pool, Swimming, Badminton, Table Tennis, Cycling, Gymnastics  
  Equestrian > Show Jumping, Dressage  
  Other > Cricket, Hockey

  </details>

---

## 💻 System Requirements

* `ffmpeg` must be installed and available in your system `PATH`.

### Installing packages

```bash
pip install guessit requests colorama

```
### How to use the noob installer for linux.
Works on Debian/Ubuntu/Mint, Fedora/RHEL/CentOS, Arch/Manjaro, openSUSE, Alpine.
```
sudo chmod +x noob-install-by-motanu.sh
./noob-install-by-motanu.sh
```
### Windows
```
Just run the executable either from release either from repo
Or if you feel freaky you can use the batchfile.
```
### MacOS with Apple Silicon
```
You are on your own but i will give you the sources you need.
There are multiple sources of ffmpeg for Apple Silicon, and each have their ups and downs, its up to you to use the best one for you.
1. https://github.com/Vargol/ffmpeg-apple-arm64-build?tab=readme-ov-file
2. https://gitlab.com/martinr92/ffmpeg
3. https://osxexperts.net/
Now you will need python:
https://www.python.org/downloads/release/python-3144/
```

### MacOs with Intel
```
You are on your own but i will give you the sources you need.
ffmpeg: https://evermeet.cx/ffmpeg/ffmpeg-123838-gb462674645.7z
python: https://www.python.org/downloads/release/python-3144/
