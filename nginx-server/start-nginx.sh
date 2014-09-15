#!/bin/bash

# Example usage as root:
# bash start-nginx.sh /etc/nginx/sites-enabled /var/www 8000
# or:
# sudo bash start-nginx.sh /etc/nginx/sites-enabled /var/www 8000

# Check for help flag
if [ $1 == "-h" ]; then
   echo " -- USAGE --"
   echo " -----------"
   echo " bash $0 /abs/path/to/sites-enabled/ /abs/path/to/project/ hostPort"
   echo ""
fi

# Verify first argument is a directory
if [ ! -d "$1" ]; then
  echo ""
  echo " --! First argument must be absolute path to nginx/sites-enabled/"
  echo " bash $0 -h for usage"
  exit 0
fi

# Absolute path to directory containing static files
if [ ! -d "$2" ]; then
  echo ""
  echo " --! Second argument must be absolute path to project"
  echo " bash $0 -h for usage"
  exit 0
fi

# Verify second argument is a valid port
if [ ! $3 > 0 ]; then
  echo ""
  echo " --! Thrird argument should be desired host port"
  echo " bash $0 -h for usage"
  exit 0
fi

# Build server
docker build -t nginx-server .

# Run nginx server
docker run -d -p $3:80 -v $2:/tmp -v $1:/etc/nginx/sites-enabled nginx-server


