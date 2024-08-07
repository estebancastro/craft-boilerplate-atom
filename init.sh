#!/bin/bash

while true; do
  read -p "Enter a project name: " folder_name

  if [ -d "$folder_name" ]; then
    if [ "$(ls -A $folder_name)" ]; then
      echo "Error: the folder already exists and is not empty."
    else
      break
    fi
  else
    mkdir $folder_name
    break
  fi
done

cd $folder_name
ddev config --project-type=craftcms --docroot=web --php-version=8.3 --database=mysql:8.0
ddev composer create -y --no-scripts "craftcms/craft"
ddev craft install
git clone git@github.com:estebancastro/craft-boilerplate-atom.git craft-boilerplate
cp craft-boilerplate/Makefile ./
make install
sleep 2 && ddev launch & ddev npm run dev
