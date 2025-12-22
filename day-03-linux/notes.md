# Day 03 – Linux System Monitoring & Shell Scripting

This document contains Linux commands for system monitoring, service management, and shell scripting fundamentals.

---

## 📈 System Monitoring

### View top processes (first 5 lines)
```bash
top -b | head -5
```
Displays the first 5 lines of system processes in batch mode.

---

## ⚙️ System Services Management

### Check Docker service status
```bash
systemctl status docker
```
Checks if Docker is active and running in the background (daemon mode).

### Check SSH daemon status
```bash
systemctl status sshd
```
Checks if the SSH daemon is active and running.

### Start Docker service
```bash
sudo systemctl start docker
```
Starts the Docker service in the background.

### Stop Docker service
```bash
sudo systemctl stop docker
```
Stops the Docker service running in the background.

---

## 📜 Shell Scripting Basics

### Creating a Shell Script

#### Example 1: Simple Echo Script

Create a file `herapheri.sh`:
```bash
vi herapheri.sh
```

Script content:
```bash
#!/bin/bash
echo "Babu bhaiya: utha le re"
echo "Raju: ayye"
```

### Give Execute Permission
```bash
chmod 700 herapheri.sh
```
Grants read, write, and execute permissions to the user only.

### Execute the Script
```bash
./herapheri.sh
```
or
```bash
bash herapheri.sh
```

---

## 🛠️ Practical Shell Scripts

### Script 1: Create Folder and File

**File:** `make_folder_file.sh`
```bash
#!/bin/bash
mkdir new_folder
cd /home/akash/my_scripts/new_folder
touch new_file.txt
echo "this is a new file" > new_file.txt
```

**Purpose:** Creates a new folder, navigates to it, creates a file, and writes content to it.

---

### Script 2: Show Date and Time

**File:** `show_date_and_time.sh`
```bash
#!/bin/bash
echo "The date is"
date | awk '{print $1, $2, $3}'
echo "The time is"
date | awk '{print $5, $6}'
```

**Purpose:** Displays the current date and time in a formatted manner using `awk`.

---

### Script 3: Disk Space Usage
```bash
#!/bin/bash
df -H
echo "Disk space available"
df -H | xargs | awk '{print $16"/"$15}'
```

**Purpose:** Shows disk space usage and extracts specific information about available space.

**Note:** `xargs` takes the whole output as an argument for further processing.

---

## 🔧 Shell Environment

### Check Current Shell
```bash
echo $SHELL
```
Displays the path of the current shell (e.g., `/bin/bash`).

### View All Environment Variables
```bash
printenv
```
Shows all environment variables currently set in the system.

---

## 💡 Important Concepts

### Shebang (`#!/bin/bash`)

The **shebang** (`#!`) is the first line in a shell script that tells the system which interpreter to use for executing the script.
```bash
#!/bin/bash
```

This ensures the script runs using the Bash shell.

### `xargs` Command
```bash
xargs
```
Takes the output from one command and passes it as arguments to another command.

**Example:**
```bash
df -H | xargs | awk '{print $16"/"$15}'
```

---

## 🖥️ System Information

### Check Disk Space Usage
```bash
df -H
```
Displays disk space usage in human-readable format (using powers of 1000).

### Check Operating System
```bash
cat /etc/os-release
```
Shows information about the current operating system, including:
- OS name
- Version
- ID
- Pretty name

**Example Output:**
```
NAME="Ubuntu"
VERSION="22.04.1 LTS (Jammy Jellyfish)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 22.04.1 LTS"
```

---

## 📝 Best Practices for Shell Scripts

1. **Always use shebang** (`#!/bin/bash`) at the beginning
2. **Set appropriate permissions** using `chmod`
3. **Add comments** to explain complex logic
4. **Use meaningful variable names**
5. **Test scripts** in a safe environment before production use
6. **Handle errors** gracefully with proper error checking

---

## 🎯 Key Takeaways

- System services can be managed using `systemctl`
- Shell scripts automate repetitive tasks
- The shebang (`#!/bin/bash`) specifies the script interpreter
- `chmod` is used to set execution permissions
- Environment variables can be viewed with `printenv`
- `xargs` helps in chaining commands effectively
