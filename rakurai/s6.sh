#!/bin/bash 
# Input CSV file 
input_file="bash_scripting_q6.csv" 
# Output log file for warnings 
warning_log="warnings.log" 
# Temporary file to store valid rows 
valid_rows="valid_rows.csv" 
# Clear the warning log and valid rows 
> "$warning_log" 
> "$valid_rows" 
# Read the CSV file and process each line 
awk -F, 'NR==1{print > "'$valid_rows'"} NR>1{ 
phone=$4 
if (phone ~ /^[0-9]{3} [0-9]{3}-[0-9]{4}$/) { 
print > "'$valid_rows'"
 } else { 
 print "Warning: Invalid phone number format in row: " NR-1 " - " $0 >> "'$warning_log'"
  } 
  }' "$input_file" 
  echo "Processing completed. Check $warning_log for warnings and $valid_rows for valid rows."
