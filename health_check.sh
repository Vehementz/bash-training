#!/bin/bash

##  health_check.sh => Server Health Check Script

##
# BASH script that checks the following:
#	- TCP ping
#   - Memory usage
#   - CPU load
#   - Number of TCP connections
#   - Kernel version
##

##
# Memory check
##


# server_name=$(hostname)

read -p "IP server" server
read -p "Choose a port server" port


function ping_server() {
	local server=$1
	echo "Pinging $server...."
	sudo ping -c 1 $server > /dev/null 2>&1
	if [ $?  -eq 0 ]; then
		echo "$server is accessible"
	else 
		echo "$server is not accessible"
	fi
} 

function check_port() {
	local port=$2
	local server=$1
	echo "Checking port on $server"
	nc -z $server $port > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "port $port on $server is open"
	else
		echo "Port $port on $server is closed."
	fi
}

function memory_check() {
    echo "#######"
	echo "The current memory usage on ${server_name} is: "
	free -h
	echo "#######"
}


function http_check() {
	local_url=$1
	echo "Checking URL $url..."
	response=$(curl -s -o /dev/null -w "%{http_code}" $url)
	if [ $response -eq 200]; then
		echo "$url is accessible and return a 200 code."
	else 
		echo "$url returned response code $response"
	fi	
}

function cpu_check() {
    echo "#######"
	echo "The current CPU load on ${server_name} is: "
    echo ""
	uptime
    echo "#######"
}
function tcp_check() {
    echo "#######"
	local url=$1
	echo "Checking URL $url..."
	# response=
	echo "Total TCP connections on ${server_name}: "
    echo ""
	cat  /proc/net/tcp | wc -l
    echo "#######"
}

function kernel_check() {
    echo "#######"
	echo "The exact Kernel version on ${server_name} is: "
	echo ""
	uname -r
    echo "#######"
}

function all_checks() {
	memory_check
	cpu_check
	ping_server
	http_check
	tcp_check
	kernel_check
}

all_checks