#!/bin/bash

yarn install
if [ ! -e ./node_modules/@angular/compiler-cli/ngcc/__ngcc_lock_file__ ]; then
  echo "No existing pid."
else
  echo "Removing existing server.pid..."
  rm -f ./node_modules/@angular/compiler-cli/ngcc/__ngcc_lock_file__
fi
yarn start --host 0.0.0.0 --port 4200
