#!/bin/bash
MAX_VOL=150

while true; do
  CUR_VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')
  if [ "$CUR_VOL" -gt "$MAX_VOL" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ "${MAX_VOL}%"
  fi
  sleep 1
done
