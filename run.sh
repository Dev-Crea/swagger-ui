#!/bin/bash

set -e

# File repalce
INDEX='/app/dist/index.html'

# Replace URL
sed -i -e 's@window.location.toString.*;@"'"$API_URL"'";@g' $INDEX

# Replace API KEY
if [[ -n $API_KEY ]]
then
  sed -i -e "s@myApiKeyXXXX123456789@$API_KEY@g" $INDEX
  sed -i -e '103d;100d' $INDEX
fi

# Execute server HTTP
./node_modules/gulp/bin/gulp.js serve
