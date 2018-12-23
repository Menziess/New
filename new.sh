#!/bin/bash

GREEN='\033[1;32m'
WHITE='\033[0m'

# Detect internet connection
wget -q --tries=10 --timeout=20 --spider http://google.com
if [[ $? -eq 0 ]]; then
  echo "New python project v0.1"
else
  echo "No internet connection"
  exit 1
fi

# Creating new project
read -r -p "Project name: " name

# No project name supplied
if [ -z "$name" ]
  then
    echo "No project name supplied"
    exit 1
fi

# Exports
export APP_NAME=$name

# Creating new project
echo -e "Creating new project: ${GREEN}$name${WHITE}"
mkdir $name &&
git clone https://github.com/Menziess/New.git $name &&

# Init new git repository
cd $name && rm -rf .git && git init &&

# Update makefile
envsubst < "Makefile.sh" > "Makefile" &&
rm Makefile.sh &&

# Genreate dockerignore file
cp .gitignore .dockerignore &&

# Generate .pylintrc
pylint --generate-rcfile > .pylintrc

# Print makefile commands
echo -e "${GREEN}"$name "${WHITE}has been created" &&
make help

# Open vscode
read -r -p "Do you wish to open the project in vscode? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
 code .
 ;;
esac
