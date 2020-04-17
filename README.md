# passbolt_ansible
A complete (set of) playbook(s) to selfhost passbolt.

## HOW-TO:

German: https://neuroforge.de/passbolt-ein-open-source-passwort-manager/

## Short (english) HOW-TO:

1. Adapt `files/certs/passbolt_server/gen_root_cert.sh` and `files/certs/passbolt_server/gen_server_cert.sh` to generate certificates that fit your organisation. (Tip: search for `emailAddress=test@your-domain.de`)
2. Adapt `files/certs/passbolt_server/recreate_server_certs.sh` and replace the placeholders accordingly
3. Adapt `inventories/passbolt/group_vars/all/all_config.yml` according to the comments in the file.
4. Adapt your Ansible inventory to point to the correct IP in `inventories/passbolt/hosts.yml`.
5. Run `ansible-playbook -i inventories/passbolt_sever/hosts.yml full_setup.yml`.
6. Connect to the passbolt shell with `bash passbolt_shell.sh <your-server-ip>`
7. Run `su -c "./bin/cake passbolt register_user -u admin@yourorg.com -f Admin -l Adminson -r admin" -s /bin/bash www-data`
8. Complete the Passbolt setup in your browser.

