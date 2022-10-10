#!/bin/bash

# This script will:
# 1. Use ffmpeg to get video detail (We will have an error so 2>&1 will send contents of stderr to stdout so we can use grep in next step
#								     2: file descriptor for stderr, 1: file descriptor for stdout
#									 We have to use & for 1, otherwise bash will think we want to send contents of stderr to a file named 1)
# 2. Find duration line and filter out just the duration
# 3. Get hour, minute and seconds of duration
# 4. Calculate total duration in seconds (Also here numbers are converted to base 10 so that something like 00 or 04 won't make a problem)
# 5. Convert total duration to minutes and seconds

totalDuration=0
for mp4 in *.mp4
do
	duration=$(ffmpeg -i "$mp4" 2>&1 | grep "Duration" | cut -d "," -f 1 | sed "s/Duration: //")
	hours=$(echo $duration | cut -d ":" -f 1)
	mintues=$(echo $duration | cut -d ":" -f 2)
	seconds=$(echo $duration | cut -d ":" -f 3 | cut -d "." -f 1)

	totalDuration=$(($totalDuration + $((10#$hours))*3600 + $((10#$mintues))*60 + $((10#$seconds))))
done
echo "Total Duration: $(($totalDuration/60))min $(($totalDuration - $totalDuration/60 * 60))s"