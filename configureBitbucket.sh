#!/bin/bash

REPO_NAME=`git remote -v|grep fetch|awk -F'\/' '{print $2}'`

echo $REPO_NAME

