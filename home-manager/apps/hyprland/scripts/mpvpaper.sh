#!/usr/bin/env sh

start_mpvpaper() {
    mpvpaper -s -o "no-audio loop hwdec=auto" eDP-1 ~/Videos/wallpapers
}

kill_mpvpaper() {
    killall .mpvpaper-wrapper
}

# Restart mpvpaer every 30 min to avoid excessive memory consumption
while true; do
    start_mpvpaper
    sleep 1800
    kill_mpvpaper
    sleep 1
done
