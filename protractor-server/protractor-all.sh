#!/bin/bash

# Example usage as root:
# (Pass path to directory in which npm should run)
# bash protractor-all.sh /home/user_you/code/project/ install --verbose
# or:
# sudo bash protractor-all.sh /home/user_you/code/project/ install

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
dockerFileLocation="."
if [ ! -f Dockerfile ]; then
  dockerFileLocation=$(find ./ -type d -name '*protractor-server*')
fi
docker build -t protractor-server "$dockerFileLocation"

# Get user arguments
extraElements=()
for item in "${@:2}"
do
  extraElements+="$item "
done

# Run protractor
echo "Running protractor $extraElements$1"
docker run --privileged --name selenium -d vvoyer/docker-selenium-firefox-chrome
sleep 5 # This really sucks, TODO: fix this asap
docker run --link selenium:selenium -v $1:/tmp/ protractor-server protractor $extraElements
