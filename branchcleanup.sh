#!/bin/sh 
echo "Enter repo to inactive branches" 
read repo_name 
echo "Enter username" 
read user_name 
echo "Enter Password: " 
read -s password 
presentdate=`date +'%s'` 
list_of_branches=$(curl -s -u $user_name:$password https://api.github.com/repos/$user_name/$repo_name/branches | grep '\"name\"' | awk '{print $2}') | cut -d'"' -f 2 
for branch in $list_of_branches; do 
api_branch_name=$(echo $branch | cut -d'"' -f 2) 
last_updated_date=$(curl -s -u $user_name:$password https://api.github.com/repos/$user_name/$repo_name/branches/$api_branch_name | grep 'date'| awk '{print $2}'| cut -d'"' -f 2) 
api_last_updated_date=$(echo $last_updated_date | cut -d'"' -f 2) 
last_updated_date_sec=$(date -d $api_last_updated_date +%s) 
numberofdays=$(( ($presentdate - $last_updated_date_sec)/(1*1*24) )) 
if [ $numberofdays -gt 1 ] ; then 
echo "Branch $api_branch_name is updated $numberofdays days back" 
fi 
done