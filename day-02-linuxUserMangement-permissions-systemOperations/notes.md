# Day 02 – Linux User Management, Permissions & System Operations

This document contains Linux commands for user management, group operations, permissions, file searching, and system services.

---

## 👥 User Management

### Create a new user
```bash
sudo useradd akash-test -m
```
Creates a new user `akash-test` with a home directory (`-m` flag).

### Set password for user
```bash
sudo passwd akash-test
```
Sets or changes the password for the user `akash-test`.

### Switch user
```bash
su akash-dev
```
Switches to the user `akash-dev`.

### List all users
```bash
sudo cat /etc/passwd
```
Displays the list of all users on the system.

### Check if a user exists
```bash
grep -r akash-devops /etc/passwd
```
Searches for the user `akash-devops` in the `/etc/passwd` file.

---

## 👨‍👩‍👧‍👦 Group Management

### Create a new group
```bash
sudo groupadd devops
```
Creates a new group named `devops`.

### List all groups
```bash
sudo cat /etc/group
```
Displays the list of all groups on the system.

### Add user to a group
```bash
sudo gpasswd -a akash-test devops
```
Appends the user `akash-test` to the `devops` group.

### Set multiple members in a group
```bash
sudo gpasswd -M akash,akash-dev devops
```
Sets `akash` and `akash-dev` as members of the `devops` group.  
⚠️ **Note:** This replaces existing members.

---

## 🔐 Permissions & Access Control

### View sudoers file
```bash
sudo cat /etc/sudoers
```
Displays all sudo permissions configured on the system.

### View Access Control List (ACL)
```bash
sudo getfacl /home/akash-dev/dev-files/dev_file.txt
```
Shows the Access Control List for the specified file.

### Modify Access Control List (ACL)
```bash
sudo setfacl -m u:akash:rwx /home/akash-dev/dev-files/dev_file.txt
```
Grants read, write, and execute permissions to user `akash` for the specified file.

---

## 🔍 Search Operations

### Find word in file system
```bash
grep -r devops /home/akash
```
Recursively searches for the word `devops` in `/home/akash` directory.

### Case-insensitive search
```bash
grep -r -i devops /home/akash
```
Recursively searches for the word `devops` (case-insensitive) in `/home/akash` directory.

---

## 📊 Text Processing with `awk`

### Print specific columns from log file
```bash
awk '/INFO/ {print NR,$1,$2,$4}' log.txt
```
Prints line number (`NR`) and columns 1, 2, and 4 where the word `INFO` appears in `log.txt`.

### Filter lines by range and pattern
```bash
awk 'NR>=10 && NR<=50 && /INFO/ {print}' log.txt
```
Prints lines 10 to 50 that contain the word `INFO` from `log.txt`.

---

## 🌐 SSH & File Transfer

### SSH into remote server
```bash
ssh -i shubham-linux-key.pem ubuntu@<server-ip>
```
Connects to a remote server using SSH with a private key file.

### Send local file to server (SCP)
```bash
scp -i shubham-linux-key.pem local.txt ubuntu@<server-ip>:/home/ubuntu
```
Copies `local.txt` from local machine to the remote server's `/home/ubuntu` directory.

### Download file from server to local (SCP)
```bash
scp -i shubham-linux-key.pem ubuntu@<server-ip>:/home/ubuntu/new_file1.txt .
```
Copies `new_file1.txt` from the remote server to the current local directory.

💡 **Note:** SCP commands are meant to be run from your local machine.

---


