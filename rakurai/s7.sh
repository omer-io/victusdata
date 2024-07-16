#!/bin/bash

INPUT_FILE="bash_scripting_q6.csv"
OUTPUT_FILE="output.csv"
LOG_FILE="warnings.log"

# Initialize the output file and log file
echo "" > $OUTPUT_FILE
echo "" > $LOG_FILE

# Read the input CSV file line by line
while IFS=, read -r id name phone; do
    # Remove all non-digit characters from the phone number
    cleaned_phone=$(echo $phone | tr -cd '[:digit:]')
   
    # Check if the cleaned phone number has exactly 10 digits
    if [[ $cleaned_phone =~ ^[0-9]{10}$ ]]; then
        # Format the phone number to (xxx) xxx-xxxx
        formatted_phone=$(echo $cleaned_phone | sed 's/\([0-9]\{3\}\)\([0-9]\{3\}\)\([0-9]\{4\}\)/(\1) \2-\3/')
        echo "$1,$2,$3,$formatted_phone" >> $OUTPUT_FILE
    else
        # Log a warning message for incorrectly formatted phone numbers
        echo "Warning: Incorrect phone number format for ID $id, Name $name, Phone $phone" >> $LOG_FILE
    fi
done < $INPUT_FILE
