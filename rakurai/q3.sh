#!/bin/bash

echo -e "CPU Usage\nUsing mpstat command:\n" | tee report.txt
mpstat | tee -a report.txt

echo -e "\nUsing top command:\n" | tee -a report.txt
top -n 2 | tee -a report.txt
 
echo -e "\nMemory Usage\n" | tee -a report.txt
free -h | tee -a report.txt

echo -e "\nDisk Space\n" | tee -a report.txt
df -h | tee -a report.txt

echo -e "\nNetwork Statistics\n" | tee -a report.txt
ifconfig | tee -a report.txt


