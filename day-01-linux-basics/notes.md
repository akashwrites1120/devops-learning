# Day 01 – Linux Basics & File Operations

This document contains basic Linux commands related to directory navigation, users, permissions, and file operations.

---

## 📁 Directory Navigation

### `cd`
```bash
cd /home/ubuntu
```
Changes the current directory to `/home/ubuntu`.
```bash
cd
```
If no path is provided after `cd`, the user is redirected to the home directory.

---

## 👤 User Information

### `whoami`
```bash
whoami
```
Displays the username of the currently logged-in user.

---

## 🔐 Superuser & Permissions

### `sudo`
```bash
sudo <command>
```
Executes a command with superuser (root) privileges.

### `sudo su`
```bash
sudo su
```
Switches the current user to the root user.

---

## 🗑️ File & Folder Deletion

### Delete a folder forcefully
```bash
rm -rf folder_name
```
Deletes a folder and all its contents recursively.  
⚠️ **Use with caution.**

### Delete a file
```bash
rm my_file.txt
```
Removes a single file.

---

## 📄 File Creation

### Create a new file
```bash
touch my_file.txt
```
Creates an empty file.

### Create multiple files
```bash
touch file{1..10}
```
Creates files: `file1` to `file10`.

---

## ✍️ Writing & Reading Files

### Write content to a file
```bash
echo "akash is learning devops" > newFile.txt
```
Writes text to `newFile.txt`.  
Overwrites the file if it already exists.

### Read file content
```bash
cat newFile.txt
```
Displays the content of the file.

---

## 📝 File Editing using `vi`

### Open file in editor
```bash
vi newFile.txt
```

### Common `vi` commands
```
:wq  → Save and exit
:q!  → Exit without saving
```

---

## 📋 File Listing & Metadata

### List files with details
```bash
ls -la
```
Displays permissions, ownership, size, and creation/modification time.

---

## 🔁 Move & Rename Files

### Move files using wildcard
```bash
mv file* devops/
```
Moves all files starting with `file` into the `devops` directory.

### Rename a file
```bash
mv file1.txt superFile1.txt
```
Renames `file1.txt` to `superFile1.txt`.