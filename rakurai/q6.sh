#!/bin/bash

#!/bin/bash

data="bash_scripting_q6.csv"

#task1
if [ -f "$data" ] && [ -r "$data" ]; then
    echo "file exists and is readable"
else
    echo "file either dosen't exist or is not readable"
fi

#task2
newdata="formatted.csv"
#cp "$data" "$newdata"
#chmod +rw $newdata
touch $newdata
echo -e "First Name\tLast Name\tEmail\tPhone Number\tFull Name\tEmail Domain" > "$newdata"


#task3
output_file="warnings.log"
> "$output_file"

read -r header < "$data"
while IFS=, read -r col1 col2 col3 col4; do
    if ! [[ "$col4" =~ ^[0-9]{3}\ [0-9]{3}-[0-9]{4}$ ]]; then
        echo "Warning: Incorrect phone number in: $col1,$col2,$col3,$col4" >> "$output_file"
    fi
done < "$data"

echo "Warnings in $output_file."




#task4,5,6,7
awk -F ',' 'NR>1 {split($3, parts, "@"); print $1","$2","$3","$4","$1" "$2 "," parts[2]}' "$data" | sort -t ',' -k 5 >> "$newdata"

#task8
rows1=$(wc -l < "$data")
echo "Total rows: $rows1"

rows2=$(wc -l < "$newdata")
echo "rows in formatted file: $rows2"

domains=$(awk -F ',' 'NR>1 {split($3, parts, "@"); print parts[2]}' "$data" | sort | uniq -c | sort -rn | head -n 10)
echo "Top 10 most common email domains:"
echo "$domains" | awk '{print $2, "-", $1, "times"}'


