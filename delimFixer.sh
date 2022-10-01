#!/bin/bash

# This script will: 
# 1. Replace a specific character in filename with a new character

filesFormat=".mp4"
for file in *$filesFormat
do
	oldDelim="-"; newDelim=" "
	mv $file "${file//$oldDelim/$newDelim}"
done