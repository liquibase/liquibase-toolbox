#!/bin/bash

latest_version="$(curl -s https://github.com/liquibase/liquibase/releases/latest | grep -o "v.*" | sed s/'>.*'//g |  sed s/'v'//g | sed 's/"//g')"
version="${1:-$latest_version}"
if [ -z "$1" ]
  then
    tput setaf 2; echo No argument provided!
    echo Please make sure to specify a Liquibase version in the following format [x.x.x]. For example: "~/update_liquibase" $version
    echo To see available versions visit https://github.com/liquibase/liquibase/releases

while true; do    
  read -p "Would you like to update to the latest Liquibase version $version (Y/N)? " yn;tput sgr0 
  case $yn in
    [Yy]* ) break;;
    [Nn]* ) exit;;
    * ) tput setaf 2;echo "Please answer Y or N.";;
  esac
done
fi

cd

if curl --fail -L https://github.com/liquibase/liquibase/releases/download/v${version}/liquibase-${version}.zip --output liquibase-${version}.zip ; 
then
    unzip -o -d liquibase liquibase-${version}.zip
    tput setaf 2; echo "Liquibase is now updated to version $version"
    echo "Running liquibase --version";tput sgr0
    ~/liquibase/liquibase --version
else
    tput setaf 2; echo "ERROR: Please make sure to specify the correct version in the following format [x.x.x]. 
For example(latest version): ~/update_liquibase" $latest_version
    echo "To see available versions visit https://github.com/liquibase/liquibase/releases";tput sgr0
fi
