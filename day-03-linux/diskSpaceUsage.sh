#!/bin/bash
df -H
echo "Disk space available"
df -H | xargs | awk '{print $16"/"$15}'