#!/bin/bash

input_file="bash_scripting_q6.csv"
output_file="warnings.log"

# Clear the warnings log file if it exists
> "$output_file"

# Read the CSV file line by line
while IFS=, read -r col1 col2 col3 col4 col5; do
    # Check if the phone number in the 4th column matches the format xxx xxx-xxxx
    if ! [[ "$col4" =~ ^[0-9]{3}\ [0-9]{3}-[0-9]{4}$ ]]; then
        # If the format doesn't match, log the entire row to the warnings log file
        echo "Warning: Incorrect phone number format in row: $col1,$col2,$col3,$col4,$col5" >> "$output_file"
    fi
done < "$input_file"

echo "Check complete. Warnings logged to $output_file."

