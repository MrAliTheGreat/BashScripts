#!bin/bash

targetFileFormat=".mp3"												# Files format
separatorWord=""												# Separator word
addWord=""													# Special word

for fileName in *$targetFileFormat
do
	newFileName=${fileName//$separatorWord*/}								# Slice filename from separator word
	newFileName=${newFileName//-/ }										# Remove all "-" delimiters from filename

	newFileName=${newFileName//"Official"/}									# Remove different additional word from filename
	newFileName=${newFileName//"Audio"/}									# Remove different additional word from filename
	newFileName=${newFileName//"Video"/}									# Remove different additional word from filename
	newFileName=${newFileName//"Lyric"/}									# Remove different additional word from filename
	newFileName=${newFileName//"Music"/}									# Remove different additional word from filename
	newFileName=${newFileName//$addWord/}									# Remove special word from filename

	newFileName=`echo $newFileName`										# Strip filename
	newFileName="${newFileName} - ${addWord}${targetFileFormat}"						# Add special word and file format to filename

	mv "./${fileName}" "${newFileName}" &									# Rename files to their new fixed name
done