# 🚀 Linux Task Management & Access Control System

This project implements a fully structured **Linux-based task management environment** designed for multi-role organizations (Supervisors, Engineers, and Operators). It leverages **POSIX permissions, ACLs, directory hierarchy design, and Bash scripting** to enforce secure workflow separation and automated performance tracking.

## 🏗️ System Architecture

* 🔐 **User & Group Management:**
  Created dedicated users for each role and mapped them to their respective groups (`Supervisors`, `Engineers`, `Operators`), with Supervisor1 elevated to the `wheel` group for administrative control.

* 🗂️ **Factory Environment Setup:**
  Built a complete directory tree under `/home/Factory` containing:

  * `Tasks/` → Role-based and user-specific task folders
  * `Employee_Performance/` → Completed task storage
  * `Completed_Tasks/` → Per-user archival space

* 🔏 **Permission Enforcement:**
  Implemented strict directory and file permissions (e.g., `751`, `770`, `570`) to control directory traversal, read/write restrictions, and task isolation.

* 🎯 **Fine-Grained ACLs:**
  Used `setfacl` to allow Engineers **read/execute access** to specific Operators’ task folders, while preventing reverse access — achieving controlled cross-role visibility.

## 🛠️ Automation Scripts

### ✔️ `complete_task.sh`

A robust Bash script enabling users to “submit” tasks by securely copying them from their task directories into their personal `Completed_Tasks` folder.

* Detects user role (Engineer/Operator) dynamically
* Validates task existence
* Prevents duplicate submissions
* Color-coded terminal feedback (ANSI sequences)

### 📊 `get_kpi.sh`

Automates KPI calculation with:

* Dynamic task count extraction
* Floating-point math via `bc`
* Timestamped appending to `<user>_KPI.txt`
* KPI formula: `completed_tasks / total_tasks`

## ⚙️ Key Features

* 🧩 Modular directory structure
* 🔒 Zero access leakage across users
* 👨‍💼 Supervisor-accessible performance logs
* 🧪 Tested with multiple user roles and realistic workflows

## 📚 Summary

This project demonstrates Fundimentals of **Linux system administration**, including user management, permission modeling, ACL manipulation, and Bash automation. It provides a reproducible, secure, and role-based environment suitable for workflow simulation, training, and performance evaluation.
