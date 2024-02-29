#!/bin/bash
echo "Check if user IP address is a valid IP address"
read -p "Enter an IP address" ip_input
if ! [[ "$ip_input" =~ (^[0-9]{1,3}\.){3}[0-9]{1,3} ]]
    then
        echo "Is not a correct ip address"
fi

if [[ "$ip_input" =~ ([0-9]{1,3}\.){3}[0-9]{1,3} ]]
    then
        echo "Is a correct ip address"
fi

