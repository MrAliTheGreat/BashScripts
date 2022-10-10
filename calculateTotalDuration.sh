#!/bin/bash

# This script will:
# 1. Use ffprobe instead of ffmpeg to get each mp4's duration (ffprobe will return the duration in seconds so no more problem with conversion like ffmpeg)
# 2. Putting each duration in a string with + between (num+num+num...)
# 3. Use bc to calculate the total sum (bc will receive a string of mathematical expression and calculate the value. It also works with floating point numbers! 
#										bc is only available on linux so I used wsl, it won't work with git bash)
# 4. Convert total duration in seconds to minute and seconds

totalDuration=$(
	for mp4 in *.mp4
	do
		ffprobe -i "$mp4" -show_format -v quiet | grep duration | sed "s/duration=//" &
	done | paste -sd+ | bc
)

mintues=$(echo $totalDuration/60 | bc)
seconds=$(echo $totalDuration-$mintues*60 | bc)

echo "${mintues}min ${seconds}s"



# This script is much faster and more accurate than the ffmpeg one I put up in the last commit! 
# Here we can also use & for concurrency since the loop is not sequential like the previos code!