#!/bin/bash

dir="txtfiles/*.txt"

echo "Enter keyword to search in text files"
read word

egrep -in $word $dir | tee output.txt
echo "Output written in txt file."
