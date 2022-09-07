#!/bin/bash

# This script will: 
# 1. Find the srt file of each mp4 file (In my case, srt filename starts with the filename of its corresponding mp4)
# 2. Change the name of both the srt and mp4 file to some similar name (Numbers starting from 1 are used for the name)

index=1
for mp4File in *.mp4
do
	srtFile="${mp4File//.mp4/}"*.srt
	mv "$mp4File" $index.mp4 | mv $srtFile $index.srt
	let "index+=1"
done

# Changing the srt filename to the mp4 filename did not do the trick for me!
# I believe for me at least there was a problem with the mp4 files.
# That's why I changed the names to somthing similar!