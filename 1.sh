#!/bin/sh
skip_branch_name=$(echo Enter repo to inactive branches need to delete| cat gitbranchexclude.txt)
git log --after=" 1 days ago" | git branch --sort=committerdate | egrep -v "(^\\*|master|dev|skip_branch_name)"

