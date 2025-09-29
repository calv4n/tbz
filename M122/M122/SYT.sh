#!/bin/bash

# Define variables for file output
timestamp=$(date '+%Y-%m-%d_%H%M')
hostname=$(hostname)

# Define function to print section headers
function print_section_header {
    printf "\n%s\n%s\n\n" "$1" "=============================="
}

# Set threshold for CPU usage
cpu_threshold=90

# Check CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
if [ $(echo "$cpu_usage > $cpu_threshold" | bc -l) -eq 1 ]; then
    # CPU usage has exceeded threshold, send email
    mail -s "CPU usage threshold exceeded on $hostname" chemibrothers@bluewin.ch <<< "CPU usage on $hostname has exceeded the threshold of $cpu_threshold%. Current CPU usage is $cpu_usage%."
fi

# Print hostname
print_section_header "Hostname"
hostname

# Print OS version
print_section_header "OS Version"
cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f 2

# Print CPU information
print_section_header "CPU Information"
lscpu | egrep 'Model name|Socket|Thread|NUMA|CPU/(s/)'

# Print memory information
print_section_header "Memory Information"
free -h | awk 'NR==1{print "Total Memory: " $2} NR==2{print "Used Memory: " $3} NR==3{print "Free Memory: " $4}'

# Print filesystem information
print_section_header "Filesystem Information"
df -h | awk 'BEGIN {print "Filesystem\tSize\tUsed\tAvail\tUse%\tMounted on"} NR>1{print $1 "\t\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6}'

# Print system uptime
print_section_header "System Uptime"
uptime

# Print current system time
print_section_header "Current System Time"
date

# Check for file output option
if [ "$1" == "-f" ]; then
    # Write output to file
    output_file="${timestamp}-sys-${hostname}.info"
    exec &> >(tee -a "${output_file}")
fi

