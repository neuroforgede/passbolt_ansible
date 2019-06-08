#!/bin/bash

old_pwd=$(pwd)

DATE=`date +"%m-%d-%y"`
BASE_DIR=passbolt_backup_$1_$DATE
mkdir -p $BASE_DIR

cd $BASE_DIR
ssh -t -i "${old_pwd}/ssh_keys/root_rsa" root@$1 mysqldump --all-databases > "mariadb-$1-$DATE.sql"
mkdir -p all_ansible_data_backup
scp -i "${old_pwd}/ssh_keys/root_rsa" -r root@$1:/data/ansible all_ansible_data_backup