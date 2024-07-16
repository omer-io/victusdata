#!/bin/bash

logs="bash_script_4_example.txt"

tail -n 0 -F "$logs" | while read -r line
do
   if echo "$line" | egrep "^error:|^warning:" > /dev/null; then
        echo "Alert: $line"
   fi
done

