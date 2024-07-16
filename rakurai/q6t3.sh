while IFS=$'\t' read -r first_name last_name email phone_number; do
# Check if phone number matches the expected format (xxx xxx-xxxx)
if [[ $phone_number =~ ^[0-9]{3}\ [0-9]{3}-[0-9]{4}$ ]]; then
    # Format phone number as (xxx) xxx-xxxx
    formatted_phone="(${phone_number:0:3}) ${phone_number:4}"
    # Output the formatted line
    echo -e "$first_name\t$last_name\t$email\t$formatted_phone"
else
    # Log warning for incorrect phone number format
    echo "Warning: Invalid phone number format for $first_name $last_name: $phone_number" >> "$logfile"
fi
done < "$newdata"
