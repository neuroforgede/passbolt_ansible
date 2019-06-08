#!/bin/bash
DATE=`date +"%m-%d-%y"`
ssh -t -i ssh_keys/root_rsa root@$1 mysqldump --all-databases > "mariadb-$1-$DATE.sql"
mkdir -p all_ansible_data_backup_$DATE
scp -i ssh_keys/root_rsa -r root@$1:/data/ansible all_ansible_data_backup_$DATE