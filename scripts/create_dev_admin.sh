#!/bin/sh

# Shell script to Create an Admin superuser in DEV environment.
# Intended to be run from host machine.
# Run from 'Makefile' file level.

# To run Django project 'manage' commands in the container:
#   Run 'docker-compose run project python /wrkdir/project/manage.py [command]'

# Set current directory to script directory

. .env

echo "Creating Superuser for Django Project $PROJECT_NAME"

if [ "$DEVELOPMENT" = "True" ]
then
  docker-compose run ${PROJECT_NAME} python3 ${DJANGO_PROJECT_NAME}/manage.py runscript create_dev_admin
else
  echo "\033[91m "
  echo "*** ERROR!!! *** \nCommand only available on DEV ebvironment."
  echo "\x1b[0m"
fi
