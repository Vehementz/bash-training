#!/bin/bash
read -p "Check Health of a specific service" service_name
sudo systemctl status "$service_name"

