#!/bin/bash

cd /home/ubuntu/git/repo_update/bash_update
# print repo status
echo -e "\nThese changes are going to be pushed to remote repo:\n"
git status

# read commit message from user
echo -e "\nEnter commit message: "
read commit_msg

# add, commit and push
git add .
git commit -m "$commit_msg"
git push origin main