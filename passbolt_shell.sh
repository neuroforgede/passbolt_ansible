#!/bin/bash
ssh -t -i ssh_keys/root_rsa root@$1 docker exec -it passbolt_master bash