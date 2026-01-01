# Docker Installation and Usage Guide

## Table of Contents
- [Core Concepts](#core-concepts)
- [Installation on Ubuntu Linux](#installation-on-ubuntu-linux)
- [Basic Docker Commands](#basic-docker-commands)
- [Running Containers](#running-containers)
- [Creating Docker Images](#creating-docker-images)
- [Example Dockerfile](#example-dockerfile)

## Core Concepts

- **Hypervisor**: Software that creates and runs virtual machines
- **Docker Image**: A read-only template with instructions for creating a Docker container
- **Docker Container**: A runnable instance of a Docker image
- **Docker Hub**: A cloud-based registry service for sharing Docker images

## Installation on Ubuntu Linux

Full documentation: [Docker Engine Installation for Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

### Step 1: Remove Conflicting Packages

```bash
sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc | cut -f1)
```

### Step 2: Add Docker's Official GPG Key

```bash
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

### Step 3: Add Docker Repository

```bash
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF
```

### Step 4: Install Docker Engine

```bash
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Step 5: Add User to Docker Group (Optional but Recommended)

```bash
sudo usermod -a -G docker $USER
```

**Note**: Log out and log back in for this to take effect.

## Basic Docker Commands

### Docker Service Management

```bash
# Check Docker status
sudo systemctl status docker

# Stop Docker service
sudo systemctl stop docker

# Start Docker service
sudo systemctl start docker
```

### Container Management

```bash
# Show running containers
docker ps

# Show all containers (including stopped)
docker ps -a

# Stop a container
docker stop <container_id>

# Remove a container
docker rm <container_id>

# View container logs
docker logs <container_id>
```

### Image Management

```bash
# List all local images
docker images

# Pull an image from Docker Hub
docker pull <image_name>

# Example: Pull MySQL image
docker pull mysql
```

### Container Interaction

```bash
# Enter a running container
docker exec -it <container_id> bash

# Exit container without stopping it
# Press: Ctrl + P, then Ctrl + Q
```

## Running Containers

### Example 1: MySQL Database

```bash
docker run -it --name my-db -e MYSQL_ROOT_PASSWORD=test@123 mysql:latest
```

**Flags**:
- `-it`: Interactive terminal mode
- `--name`: Assign a name to the container
- `-e`: Set environment variables

**Inside MySQL container**:
```bash
mysql -u root -p
# Ctrl + L to clear screen in MySQL
```

### Example 2: Jenkins Server

```bash
docker run -d --name jenkins-server-docker -p 8080:8080 jenkins/jenkins:latest
```

**Flags**:
- `-d`: Detached mode (daemon)
- `-p`: Port mapping (host:container)

## Creating Docker Images

### Example Dockerfile

```dockerfile
# Base image
FROM python:3.12-slim

# Create and switch to /app directory inside container
WORKDIR /app

# Copy current directory (host) to /app (container)
COPY . /app

# Run command before container creation
RUN pip install -r requirements.txt

# Expose port
EXPOSE 8000

# Command to run after container creation
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
```

### Build Docker Image

```bash
# Build image from Dockerfile in current directory
docker build . -t todo-django-app
```

**Flags**:
- `.`: Path to Dockerfile (current directory)
- `-t`: Tag/name for the image

### Run Container from Custom Image

```bash
docker run -d --name todo-django-ctr -p 8000:8000 todo-django-app
```

## Quick Reference

| Command | Description |
|---------|-------------|
| `docker ps` | List running containers |
| `docker ps -a` | List all containers |
| `docker images` | List all images |
| `docker pull <image>` | Download image from Docker Hub |
| `docker run` | Create and start a container |
| `docker stop <id>` | Stop a running container |
| `docker rm <id>` | Remove a container |
| `docker exec -it <id> bash` | Enter container shell |
| `docker logs <id>` | View container logs |
| `docker build -t <name> .` | Build image from Dockerfile |

---

**Pro Tip**: Use `Ctrl + L` to clear the terminal screen in most Linux environments!