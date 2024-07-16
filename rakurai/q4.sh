#!/bin/bash

logs="bash_script_4_example.txt"
monitor_log() {
    last_position=$(stat -c %s "$logs")
    while true; do
        current_position=$(stat -c %s "$logs")
        if [ "$current_position" -gt "$last_position" ]; then
            tail -c +"$last_position" "$logs" | egrep -o '(^error:|^warning:).*' | while read -r line; do
                echo "Alert: $line"
            done
            last_position="$current_position" 
        fi
    done
}

monitor_log()
