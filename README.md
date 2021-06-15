# alpine-vnc
vnc-xfce4-alpine
Firefox-esr installed on alpine barebone with VNC. xfce4 is the window manager

clone repository
cd alpine-vnc
docker build -t nk10025:alpine-vnc

Run with "docker run -d --restart always --shm-size 2g -p 5900:5900 nk10025/alpine-vnc"
