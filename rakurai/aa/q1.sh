#!/bin/bash

path1="/home/ubuntu/rakurai/hello"
path2="/home/ubuntu/rakurai/aa"

echo "Source Path: $path1"
echo "Destination Path: $path2"
cp -r $path1 $path2
echo "Directory copied."

if [ $1 = y ]; then 
tar -czf "$path2/archivetar.tar.gz" "hello/"
echo "Directory compressed."
else
echo "Directory not compressed."
fi

