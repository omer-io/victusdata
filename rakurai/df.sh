df -h | awk '
NR == 1 { printf "Filesystem: %s\n", $1 }
NR == 2 { printf "Used: %s\n", $3 }
NR == 2 { printf "Available: %s\n", $4 }
NR == 2 { printf "Use Percentage: %s\n", $5 }
NR == 2 { printf "Mounted on: %s\n", $6 }
'

