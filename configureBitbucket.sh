#!/bin/bash

# https://deanclatworthy.com/2013/01/how-to-avoid-relying-on-github-mirror-your-repository/


REPO_NAME=`git remote -v|grep fetch|awk -F'\/' '{print $2}'|grep fetch|awk -F'.' '{print $1}'`

echo Configure $REPO_NAME

git remote rename origin github

git remote add bitbucket ssh://git@bitbucket.org/tecris/$REPO_NAME.git

GIT_CONFIG=.git/config

echo [remote \"origin\"] >> $GIT_CONFIG
echo "        url = git@github.com:tecris/$REPO_NAME.git" >> $GIT_CONFIG
echo "        url = ssh://git@bitbucket.org/tecris/$REPO_NAME.git" >> $GIT_CONFIG
