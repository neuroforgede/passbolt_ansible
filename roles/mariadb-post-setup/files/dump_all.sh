#!/bin/bash

DATE=`date '+%Y_%m_%d_%H_%M_%S'`

su mysql -c "mysqldump --all-databases" > /data/ansible/mariadb_dumps/mariadb_${DATE}.sql