#!/bin/bash

# This script will:
# 1. Unrar rar files with the given password
# 2. Remove redundant extracted files (In my case, txt url jpg files)

password="www.irlanguage.com"
for rarFile in *.rar
do
	unrar -p$password e "$rarFile"
	rm *.txt *.url *.jpg
done