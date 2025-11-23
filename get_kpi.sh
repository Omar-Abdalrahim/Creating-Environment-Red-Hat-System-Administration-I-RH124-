#!/bin/bash
# get_kpi.sh
USER=$(whoami)

# Determine total tasks for the user by checking the original tasks directory
if [ -d "/home/Factory/Tasks/Engineers_Tasks/$USER" ]; then
  TOTAL=$(ls -1 /home/Factory/Tasks/Engineers_Tasks/"$USER" 2>/dev/null | wc -l)
elif [ -d "/home/Factory/Tasks/Operators_Tasks/$USER" ]; then
  TOTAL=$(ls -1 /home/Factory/Tasks/Operators_Tasks/"$USER" 2>/dev/null | wc -l)
else
  echo "Could not find user's tasks directory"
  exit 1
fi

COMPLETED=$(ls -1 /home/Factory/Employee_Performance/Completed_Tasks/"$USER" 2>/dev/null | wc -l)
# Avoid division by zero
if [ "$TOTAL" -eq 0 ]; then
  KPI=0
else
  KPI=$(echo "scale=2; $COMPLETED / $TOTAL" | bc)
fi

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
echo "KPI: $KPI | $TIMESTAMP" >> /home/Factory/Employee_Performance/"${USER}_KPI.txt"
echo "KPI recorded: $KPI (Completed: $COMPLETED / Total: $TOTAL)"
