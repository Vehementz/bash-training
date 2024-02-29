#!/bin/bash

container_id="128"

container_template="local-hdd-templates:vztmpl/debian-12-standart_12.0-1_amd64.tar.zst"

container_storage=""

container_cpu=""

container_ram=""

container_swap=""

container_disk_size=""

container_ip4=""

container_gateway="192.168.1.254"

bridge="vmbr2"

pct create $container_id $container_template \
    -hostname $container_hostname \
    -cores $container_cpu \
    -memory $container_ram \
    -swap $container_swap \
    -storage $container_storage \
    -password \ 
    -net0 name=eth0, bridge=$bridge, gw=$container_gateway, ip=$container_ip4 \ && 

pct start $container_hostname






