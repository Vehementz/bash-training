#!/bin/bash
df -h 
echo "############ Other view ##############" 
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }'