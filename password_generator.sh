#!/bin/bash
#####password_generator.sh=>Generatesarandompasswordofspecifiedlengthusingcharactersfromaset
alphanumeric="0,1,2,3,4,5,6,7,8,9,AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz"
length=12
password=$(head /dev/urandom  | tr -dc "$characters" | head -c "$length")

#opensslrand-hex14

