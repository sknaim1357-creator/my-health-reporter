#!/bin/bash

# This will write everything inside { } into system-report.txt
{
  echo "Linux System Health Report"
  echo "Hostname: $(hostname)"
  echo "Kernel: $(uname -r)"
  echo "Disk Usage: $(df -h / | awk 'NR==2 {print $5}') used"
  echo "Memory Usage: $(free -h | awk '/^Mem:/ {print $3 " / " $2}')"
  echo "Top Processes:"
  ps aux --sort=-%mem | head -n 6
} > system-report.txt

echo "Report created successfully!"

