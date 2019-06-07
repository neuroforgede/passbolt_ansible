rm -r passbolt_mariadb_cert
rm -r mariadb_server_cert

bash gen_server_cert.sh root_ca passbolt_mariadb_cert 95.217.11.108 2kSCRG9ZZcHxuayAPctTrKxTC4PMXUVH
bash gen_server_cert.sh root_ca mariadb_server_cert 95.217.11.108 83JE83yzqFcuE7wzDdxFYMA5LD4j7aP6


