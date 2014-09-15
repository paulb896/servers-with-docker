#!/bin/bash

# Example usage as root:
# (Pass path to directory in which grunt should run)
# bash grunt.sh /home/user_you/code/npm-project/
# or:
# sudo bash grunt.sh /home/user_you/code/npm-project/

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
  echo "package.json must contain grunt, grunt-cli"
  echo " bash $0 -h for usage"
  exit 0
fi

# Build server
docker build -t grunt-server .

# Run grunt
docker run -v $1:/tmp/ grunt-server node node_modules/grunt-cli/bin/grunt


