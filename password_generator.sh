#!/bin/bash
#####password_generator.sh=>Generatesarandompasswordofspecifiedlengthusingcharactersfromaset
alphanumeric="0123456789AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz"
length=12
password=$(head /dev/urandom  | tr -dc "$characters" | head -c "$length")
echo "Generated password : $password"



#opensslrand-hex14

