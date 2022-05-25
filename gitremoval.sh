#!/bin/sh
git log --after=" 1 days ago" | git branch --sort=committerdate | egrep -v "(^\\*|master|dev|test8)" | xargs git branch -d
