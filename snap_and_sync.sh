raspistill -q 98 -n -t 1000 -ts -o /home/pi/timelapse/image_%d.jpg -w 3840 -h 2160 \
&& rclone copy /home/pi/timelapse dropbox:timelapse \
&& rm /home/pi/timelapse/*