#!/bin/bash

current_dir="$(pwd)"
video_width="3840"
video_height="2160"

VAR=${2:-60}

echo "Getting images from Google Drive..."
rclone copy google-drive:timelapse $current_dir

file_count=$(ls -R | wc -l)

fps=$(($file_count / $2))

echo "---------------------"
echo "File count: $file_count"
echo "Clip length: $2s"
echo "Calculated FPS: $fps"
echo "---------------------"
echo "Encoding video ($1)..."
ffmpeg -framerate $fps -pattern_type glob -i "*/*.jpg" -s:v 3840x2160 -c:v libx264 -crf 17 -pix_fmt yuv420p $1