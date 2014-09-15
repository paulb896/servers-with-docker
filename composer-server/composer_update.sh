#!/bin/bash

# Example usage as root:
# (Pass path to directory in which composer will create lock file)
# bash composer_update.sh /home/user_you/code/php-project/
# or:
# sudo bash composer_install.sh /home/user_you/code/php-project/

# Check for help flag
if [ $1 == "-h" ]; then
   echo " -- USAGE --"
   echo " -----------"
   echo " bash $0 /absolute/path/to/project/"
   echo " directory must contain composer.json"
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

# Run composer update (must include composer.json)
docker run -v /home/paul/code/framework-standard-edition:/tmp composer-server php -d memory_limit=2248M /composer.phar update
