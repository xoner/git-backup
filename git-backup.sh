#!/bin/bash

if ! [ -n "$1" ];
then
    echo "You didn't provide a path to back up"
    exit 1
fi

if [ -d "$1" ];
then
    cd "$1"
else
    echo "Can not find working directory. Provide a valid directory"
    exit 1
fi

# Check if the working dir contains a git repository
if ! [ -d .git ];
then
    echo "The directory specified doesn't contain a git repository. Nothing to do."
    exit 1
fi


# check if there are not changes in the current repository
if [ -z "$(git status --porcelain)" ];
then
    # There are no changes
    echo "There are no changes pending, skipping the process";
else
    # There are changes
    echo "Backing up the work";
    git add .
    git commit -m "Changes at $(date +%Y-%m-%d-%H-%M)"
    git remote show | xargs -I {} git push {} master
fi
