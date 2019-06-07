#!/bin/bash

/usr/bin/flock -n /tmp/mariadb-dump.lck bash /data/ansible/mariadb_dump/dump_all.sh