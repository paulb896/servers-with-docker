#!/bin/bash

# Example usage as root:
# (Pass path to directory in which vendor bundles will be installed)
# bash composer-install.sh /home/user_you/code/php-project/
# or:
# sudo bash composer-install.sh /home/user_you/code/php-project/

# Check for help flag
if [ $1 == "-h" ]; then
   echo " -- USAGE --"
   echo " -----------"
   echo " bash $0 /absolute/path/to/project/"
   echo " directory should contain composer.lock or composer.json"
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
docker build -t composer-server .

# Run composer update (must include composer.lock)
docker run -v $1:/tmp composer-server install
# docker run -i -t -v $1:/srv ubermuda/composer install

