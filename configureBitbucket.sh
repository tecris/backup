#!/bin/bash

REPO_NAME=`git remote -v|grep fetch|awk -F'\/' '{print $2}'|grep fetch|awk -F'.' '{print $1}'`

echo $REPO_NAME

