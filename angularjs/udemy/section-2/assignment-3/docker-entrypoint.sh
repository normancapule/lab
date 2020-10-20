#!/bin/bash

ng analytics off
npm install
rm -rf node_modules/@angular/compiler-cli/ngcc/__ngcc_lock_file__
npm run start -- --host 0.0.0.0 --port 4200
