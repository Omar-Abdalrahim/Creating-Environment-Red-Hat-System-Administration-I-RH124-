#!/bin/bash
# project_commands.sh
# Commands extracted from original report, in exact order, with comments.

# ---- 1. Create Users ----
sudo useradd Supervisor1
sudo useradd Engineer1
sudo useradd Engineer2
sudo useradd Engineer3
sudo useradd Operator1
sudo useradd Operator2
sudo useradd Operator3

# ---- 3. Assign Passwords ----
sudo passwd Supervisor1
sudo passwd Engineer1
sudo passwd Engineer2
sudo passwd Engineer3
sudo passwd Operator1
sudo passwd Operator2
sudo passwd Operator3

# ---- Switch to Supervisor1 ----
su - Supervisor1

# ---- 4. Create Groups ----
sudo groupadd Supervisors
sudo usermod -g Supervisors Supervisor1

# ---- 5. Create Factory directory ----
mkdir /home/Factory

# ---- 6. Create Tasks and Employee_Performance directories ----
mkdir /home/Factory/Tasks
mkdir /home/Factory/Employee_Performance

# ---- Assign ownership ----
sudo chown Supervisor1:Supervisors /home/Factory/Tasks
sudo chown Supervisor1:Supervisors /home/Factory/Employee_Performance

# ---- Set permissions ----
sudo chmod 755 /home/Factory/Tasks
sudo chmod 755 /home/Factory/Employee_Performance

# ---- 7. Create task-role directories ----
mkdir /home/Factory/Tasks/Engineers_Tasks
mkdir /home/Factory/Tasks/Operators_Tasks

sudo chown Supervisor1:Supervisors /home/Factory/Tasks/Engineers_Tasks
sudo chown Supervisor1:Supervisors /home/Factory/Tasks/Operators_Tasks

sudo chmod 751 /home/Factory/Tasks/Engineers_Tasks
sudo chmod 751 /home/Factory/Tasks/Operators_Tasks

# ---- 8. Subdirectories per user ----
mkdir /home/Factory/Tasks/Engineers_Tasks/Engineer1
mkdir /home/Factory/Tasks/Engineers_Tasks/Engineer2
mkdir /home/Factory/Tasks/Engineers_Tasks/Engineer3

mkdir /home/Factory/Tasks/Operators_Tasks/Operator1
mkdir /home/Factory/Tasks/Operators_Tasks/Operator2
mkdir /home/Factory/Tasks/Operators_Tasks/Operator3

sudo chown Engineer1:Supervisors /home/Factory/Tasks/Engineers_Tasks/Engineer1
sudo chown Engineer2:Supervisors /home/Factory/Tasks/Engineers_Tasks/Engineer2
sudo chown Engineer3:Supervisors /home/Factory/Tasks/Engineers_Tasks/Engineer3

sudo chown Operator1:Supervisors /home/Factory/Tasks/Operators_Tasks/Operator1
sudo chown Operator2:Supervisors /home/Factory/Tasks/Operators_Tasks/Operator2
sudo chown Operator3:Supervisors /home/Factory/Tasks/Operators_Tasks/Operator3

sudo chmod 770 /home/Factory/Tasks/Engineers_Tasks/*
sudo chmod 770 /home/Factory/Tasks/Operators_Tasks/*

# ---- ACL configuration ----
setfacl -m g:Engineers:x /home/Factory/Tasks/Operators_Tasks
setfacl -m u:Engineer1:rx /home/Factory/Tasks/Operators_Tasks/Operator1
setfacl -m u:Engineer2:rx /home/Factory/Tasks/Operators_Tasks/Operator2
setfacl -m u:Engineer3:rx /home/Factory/Tasks/Operators_Tasks/Operator3

# ---- Check ACL ----
getfacl /home/Factory/Tasks/Operators_Tasks/Operator1

# ---- 9. Create 10 tasks for each user ----
# (Example for one user; repeat as needed)
touch /home/Factory/Tasks/Engineers_Tasks/Engineer1/Task1
# (All other Task2..Task10 for all users were assumed manually created)

sudo chmod 570 /home/Factory/Tasks/Engineers_Tasks/Engineer1/*
# (Same for all other users)

# ---- 10. Completed Tasks directory ----
mkdir /home/Factory/Employee_Performance/Completed_Tasks

mkdir /home/Factory/Employee_Performance/Completed_Tasks/Engineer1
mkdir /home/Factory/Employee_Performance/Completed_Tasks/Engineer2
mkdir /home/Factory/Employee_Performance/Completed_Tasks/Engineer3
mkdir /home/Factory/Employee_Performance/Completed_Tasks/Operator1
mkdir /home/Factory/Employee_Performance/Completed_Tasks/Operator2
mkdir /home/Factory/Employee_Performance/Completed_Tasks/Operator3

sudo chmod 770 /home/Factory/Employee_Performance/Completed_Tasks/*

# ---- Scripts placeholders (actual script content not included here) ----
# vim complete_task.sh
# vim get_kpi.sh

# ---- Make scripts executable ----
chmod +x complete_task.sh
chmod u+x,g+x get_kpi.sh
