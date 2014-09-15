#!/bin/bash

# Script to install bower dependencies
# Example usage as root:
# (Pass path to directory in which npm should run)
# bash bower_install.sh /home/user_you/code/npm-project/
# or:
# sudo bash bower_install.sh /home/user_you/code/npm-project/

# Check for help flag
if [ $1 == "-h" ]; then
   echo " -- USAGE --"
   echo " -----------"
   echo " bash $0 /absolute/path/to/project/"
   echo ""
fi

# Verify first argument is a directory
if [ ! -d "$1" ]; then
  echo ""
  echo " --! First argument must be a directory"
  echo " bash $0 -h for usage"
  exit 0
fi

# Build server
docker build -t bower-server .
 
# Run npm install
# docker run -v $1:/tmp/ bower-server npm install
docker run -v $1:/tmp/ bower-server node node_modules/bower/bin/bower install --allow-root

