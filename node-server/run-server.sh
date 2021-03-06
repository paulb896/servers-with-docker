#!/bin/bash

# Example usage as root:
# (Pass path to directory in which npm should run)
# sudo bash run-server.sh /home/paul/code/ZoomingMapApp/
# -p : port format hostPort:containerPort
# bash run-server.sh /home/paul/code/ZoomingMapApp/

# Check for help flag
if [ $1 == "-h" ]; then
   echo " -- USAGE --"
   echo " -----------"
   echo " bash $0 /absolute/path/to/project/ serverPort hostPort"
   echo " Ex. $0 /home/user_you/code/ 8001 80"
   echo " will listen on http://localhost:port"
   echo ""
fi

# Verify first argument is a directory
if [ ! -d "$1" ]; then
  echo ""
  echo " --! First argument must be path to directory containing server"
  echo " bash $0 -h for usage"
  exit 0
fi

# Verify second argument is a valid port
if [ ! $2 > 0 ]; then
  echo ""
  echo " --! Second argument should node server port"
  echo " bash $0 -h for usage"
  exit 0
fi

# Verify third argument is a valid port
if [ ! $3 > 0 ]; then
  echo ""
  echo " --! Thrird argument should be desired host port"
  echo " bash $0 -h for usage"
  exit 0
fi

# Build server
docker build -t node-server .

# Start server
docker run -p "$3:$2" -v $1:/tmp node-server node /tmp/server.js

