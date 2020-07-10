#!/bin/bash

echo "Installing gems..."
bundle install -j 4

echo "Changing database.yml..."
cp config/database.yml.docker config/database.yml

# Run the server
if [ ! -e ./tmp/pids/server.pid ]; then
  echo "No existing server pid."
else
  echo "Removing existing server.pid..."
  rm -f ./tmp/pids/server.pid
fi

echo "Running migrate"
./bin/rails db:create db:migrate

./bin/rails s
