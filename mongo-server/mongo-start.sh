#!/bin/bash

# Example usage as root:
# sudo bash start-mongo.sh /data/db/ dbPort
# bash start-mongo.sh /data/db/ dbPort

# Check for help flag
if [ $1 == "-h" ]; then
   echo " -- USAGE --"
   echo " -----------"
   echo " bash $0 /absolute/path/to/db/files/ dbPort"
   echo " Ex. $0 /data/db/ 3113"
   echo ""
fi

# Verify first argument is a directory
if [ ! -d "$1" ]; then
  echo ""
  echo " --! First argument must be path to directory containing database files"
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

# Build server
docker build -t mongo-server .

# Start mongo listening on given port
docker run -p $2:27017 -v $1:/data/db mongo-server

