# Day 04 – Git & Version Control System

This document contains Git commands and concepts for version control, branching, and collaboration.

---

## 📚 Version Control System Concepts

### Types of Version Control Systems

#### Centralized Version Control System (CVCS)
- Single central repository
- All users connect to one central server
- Examples: SVN, Perforce

#### Decentralized Version Control System (DVCS)
- Every user has a complete copy of the repository
- Can work offline
- Examples: Git, Mercurial

---

## 🔄 Git Workflow
```
Working Directory → Staging Area → Git Directory (Repository)
```

- **Working Directory**: Where you modify files
- **Staging Area**: Where you prepare files for commit
- **Git Directory (Repository)**: Where Git stores committed changes

---

## 🚀 Git Basics

### Initialize a Git Repository
```bash
git init
```
Creates a new Git repository in the current directory.

### Check Repository Status
```bash
git status
```
Shows the status of files in the working directory and staging area.

### View Commit History
```bash
git log
```
Displays the commit history of the repository.

---

## 🔙 Undo Changes

### Restore Files
```bash
git restore filename
```
Discards changes in the working directory for a specific file.
```bash
git restore foldername
```
Discards changes in the working directory for an entire folder.

---

## 🌐 Working with Remote Repositories

### Clone a Repository
```bash
git clone <repo_link>
```
Creates a local copy of a remote repository.

**Example:**
```bash
git clone https://github.com/username/repo-name.git
```

### Add Remote Repository
```bash
git remote add origin <your_remote_git_url>
```
Links your local repository to a remote repository.

**Example:**
```bash
git remote add origin https://github.com/username/repo-name.git
```

### View Remote Repositories
```bash
git remote -v
```
Displays all configured remote repositories with their URLs.

### Push to Remote Repository
```bash
git push -u origin master
```
Pushes your local commits to the remote `master` branch.
- `-u` flag sets upstream tracking

---

## 🌿 Branching & Merging

### Create and Switch to a New Branch
```bash
git checkout -b feat/git_tut
```
Creates a new branch called `feat/git_tut` and switches to it.

### Switch to an Existing Branch
```bash
git checkout master
```
Switches to the `master` branch.

### Push Branch to Remote
```bash
git push origin feat/git_tut
```
Pushes the `feat/git_tut` branch to the remote repository, creating it on GitHub if it doesn't exist.

### Merge a Branch
```bash
git merge feat/git_tut
```
Merges the `feat/git_tut` branch into the current branch (usually `master` or `main`).

**Steps to merge:**
1. Switch to the target branch: `git checkout master`
2. Merge the feature branch: `git merge feat/git_tut`

---

## 📋 Common Git Workflow

### 1. Start a New Feature
```bash
git checkout -b feat/new_feature
```

### 2. Make Changes and Stage Them
```bash
git add .
```

### 3. Commit Changes
```bash
git commit -m "Add new feature"
```

### 4. Push to Remote
```bash
git push origin feat/new_feature
```

### 5. Switch Back to Master
```bash
git checkout master
```

### 6. Merge the Feature Branch
```bash
git merge feat/new_feature
```

### 7. Push Merged Changes
```bash
git push origin master
```

---

## 🎯 Best Practices

1. **Commit often** with meaningful commit messages
2. **Use branches** for new features or bug fixes
3. **Pull before push** to avoid conflicts: `git pull origin master`
4. **Review changes** before committing: `git status` and `git diff`
5. **Use descriptive branch names**: `feat/`, `fix/`, `docs/`
6. **Never commit sensitive data** (passwords, API keys, etc.)
7. **Write clear commit messages** that explain what and why

---

## 💡 Useful Tips

- Use `git log --oneline` for a compact commit history
- Use `git branch` to see all local branches
- Use `git branch -a` to see all branches (local and remote)
- Use `git diff` to see unstaged changes
- Use `git diff --staged` to see staged changes

---

## 🔗 Branch Naming Conventions

- `feat/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation updates
- `refactor/` - Code refactoring
- `test/` - Adding or updating tests
- `chore/` - Maintenance tasks

**Example:**
```bash
git checkout -b feat/user-authentication
git checkout -b fix/login-bug
git checkout -b docs/update-readme
```