#!/bin/bash

if (( $# == 0 )); then
    echo
    echo "You must specify an enviroment"
    echo "Usage: up.sh [-e ENVIRONMENT]"
    echo "Valid environments: dev, prod"
    exit 1
fi


while getopts "he:" flag; do
 case $flag in
   h)
   # Display script help information
   echo
   echo "Usage: up.sh [-h] [-e ENVIRONMENT]"
   ;;
   e)
   # Select the environment to use
   
   if [ $OPTARG = "dev" ]; then
     echo
     echo "Environment: $OPTARG"
     echo "Starting dev environment"
     docker-compose -f docker-compose-dev.yaml up -d
   elif [ $OPTARG = "prod" ]; then
     echo
     echo "Environment: $OPTARG"
     echo "Starting prod environment"
     docker-compose -f docker-compose.prod.yaml up -d
   else
     echo
     echo "Invalid environment"
     echo "Usage: up.sh [-e ENVIRONMENT]"
     echo "Valid environments: dev, prod"
   fi
   ;;
   *)
    # Handle invalid flags
    echo
    echo "Invalid flag"
    echo "Usage: up.sh [-h] [-e ENVIRONMENT]"
    ;;
   \?)
   # Handle invalid options
    echo "invalid option $OPTARG"
    echo "Usage: [-e ENVIRONMENT]"
    
   ;;
 esac
done