A fork from my friend phmn (TwinkPad). Why did i fork it? Well i did not want to interfer with his work with my changes and work so i forked it to apply my changes and optimizations.

# StreamMii

A simple tool that converts media into Wii compatible formats for smooth playback.

---

## 🚀 Features

* **GPU Acceleration Support:**
    * **AMD**
    * **NVIDIA** (NVENC)
    * **Intel** (QSV)
    * **CPU fallback** (not recommended due to lower quality/performance)
* **Automatic media metadata handling**

---

## 🛠️ Output Settings

| Parameter | Configuration |
| :--- | :--- |
| **Resolution** | 640x360 or 640x480 depending on aspect ratio |
| **Scaling** | Lanczos resampling |
| **Bitrate** | 1000 kbps |
| **FPS** | Usually matches source media |

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

> **More coming soon!**

---

## 💻 System Requirements

* `ffmpeg` must be installed and available in your system `PATH`.

### Installing packages

```bash
pip install guessit requests colorama

```
### How to use the noob installer for linux.
```
sudo chmod +x noob-install-by-motanu.sh
./noob-install-by-motanu.sh the script will auto promt for evelevated prevelages or just simply do sudo ./noob-install-by-motanu.sh
