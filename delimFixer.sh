filesFormat=".mp4"
for file in *$filesFormat
do
	oldDelim="-"; newDelim=" "
	mv $file "${file//$oldDelim/$newDelim}"
done