#!/bin/bash

# Optionen
output_file=""
while getopts "f" opt; do
  case ${opt} in
    f )
      output_file="yes"
      ;;
    \? )
      echo "Ungültige Option: -$OPTARG" 1>&2
      exit 1
      ;;
  esac
done

# Hostname
hostname=$(hostname)

# Betriebssystemversion
os_version=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2-)

# CPU-Modell
cpu_model=$(lscpu | egrep 'Model name' | awk '{print $3,$4,$5}')

# Anzahl der CPU-Sockel
cpu_sockets=$(lscpu | egrep 'Socket(s):' | awk '{print $2}')

# Anzahl der Threads pro Kern
threads_per_core=$(lscpu | egrep 'Thread(s) per core' | awk '{print $4}')

# Anzahl der NUMA-Nodes
numa_nodes=$(lscpu | egrep 'NUMA node(s)' | wc -l)

# Anzahl der CPUs insgesamt
total_cpus=$(lscpu | egrep '^CPU\(s\):' | awk '{print $2}')

# Arbeitsspeicher
total_memory=$(free -h | grep Mem | awk '{print $2}')
used_memory=$(free -h | grep Mem | awk '{print $3}')
available_memory=$(free -h | grep Mem | awk '{print $7}')

# Speicherplatz
total_storage=$(df -h / | awk '{print $2}')
used_storage=$(df -h / | awk '{print $3}')
free_storage=$(df -h / | awk '{print $4}')

# Systemlaufzeit und -zeit
uptime=$(uptime -p)
current_time=$(date '+%Y-%m-%d %H:%M:%S')

# Ausgabe auf Terminal und optional in Datei
if [ "$output_file" == "yes" ]; then
  output_filename="$(date '+%Y-%m-%d_%H%M')-sys-${hostname}.info"
  {
    echo "Hostname: $hostname"
    echo "Betriebssystem: $os_version"
    echo "CPU-Modell: $cpu_model"
    echo "CPU-Sockel: $cpu_sockets"
    echo "Threads pro Kern: $threads_per_core"
    echo "NUMA-Nodes: $numa_nodes"
    echo "Anzahl der CPUs insgesamt: $total_cpus"
    echo "Arbeitsspeicher (gesamt/genutzt/verfügbar): $total_memory/$used_memory/$available_memory"
    echo "Speicherplatz (gesamt/belegt/frei): $total_storage/$used_storage/$free_storage"
    echo "Systemlaufzeit: $uptime"
    echo "Aktuelle Systemzeit: $current_time"
  } | tee $output_filename
else
  {
    echo "Hostname: $hostname"
    echo "Betriebssystem: $os_version"
    echo "CPU-Modell: $cpu_model"
    echo "CPU-Sockel: $cpu_sockets"
    echo "Threads pro Kern: $threads_per_core"
    echo "NUMA-Nodes: $numa_nodes"
    echo "Anzahl der CPUs insgesamt: $total_cpus"
    echo "Arbeitsspeicher (gesamt/genutzt/verfügbar): $total_memory/$used_memory/$available_memory"
echo "Speicherplatz (gesamt/belegt/frei): $total_storage/$used_storage/$free_storage"
echo "Systemlaufzeit: $uptime"
echo "Aktuelle Systemzeit: $current_time"
}
fi