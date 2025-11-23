#!/bin/bash
# complete_task.sh
# Usage: complete_task.sh <TaskName>
if [ -z "$1" ]; then
  echo -e "\033[31mUsage: complete_task <taskname>\033[0m"
  exit 1
fi

USER=$(whoami)
TASKNAME="$1"

# Detect whether user is in Engineers or Operators tasks
if [ -d "/home/Factory/Tasks/Engineers_Tasks/$USER" ]; then
  SOURCE="/home/Factory/Tasks/Engineers_Tasks/$USER/$TASKNAME"
elif [ -d "/home/Factory/Tasks/Operators_Tasks/$USER" ]; then
  SOURCE="/home/Factory/Tasks/Operators_Tasks/$USER/$TASKNAME"
else
  echo -e "\033[31mCould not detect tasks directory for user $USER\033[0m"
  exit 1
fi

DEST="/home/Factory/Employee_Performance/Completed_Tasks/$USER"

if [ ! -d "$DEST" ]; then
  echo -e "\033[31mDestination directory $DEST does not exist\033[0m"
  exit 1
fi

if [ -f "$DEST/$TASKNAME" ]; then
  echo -e "\033[33mTask already completed.\033[0m"
  exit 0
fi

if [ -f "$SOURCE" ]; then
  cp "$SOURCE" "$DEST/"
  if [ $? -eq 0 ]; then
    echo -e "\033[32mTask $TASKNAME completed successfully.\033[0m"
    exit 0
  else
    echo -e "\033[31mFailed to copy task.\033[0m"
    exit 1
  fi
else
  echo -e "\033[31mTask $TASKNAME not found in $SOURCE\033[0m"
  exit 1
fi
