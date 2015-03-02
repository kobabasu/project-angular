#!/bin/sh
set -e

# add ff, merge ours to .git/config
if ! grep -E '^\[merge\]$' .git/config; then
cat << EOF >> .git/config
[merge]
  ff = false
EOF
  echo "\nadd ff=false to .git/config\n"
else
  echo "\nalready exists ff=false in .git/config\n"
fi

if ! grep -E '^\[merge "ours"\]$' .git/config; then
cat << EOF >> .git/config
[merge "ours"]
  name = "Keep ours merge"
  driver = true
EOF
  echo "\nadd marge ours to .git/config\n"
else
  echo "\nalready exists merge ours in .git/config\n"
fi

# project name setting
printf "project name: "
read PROJ_NAME

sed -i -e 's/{{PROJ_NAME}}/'"${PROJ_NAME}"'/' package.json 
sed -i -e 's/{{PROJ_NAME}}/'"${PROJ_NAME}"'/' bower.json 

# install
echo "\nwait for few minutes while install npm...\n"
npm install

echo "\nwait for few minutes while install bower...\n"
bower install
