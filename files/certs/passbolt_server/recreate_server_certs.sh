# passbolt_ansible

# Copyright (C) 2019  NeuroForge GmbH & Co.KG <https://neuroforge.de/>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

rm -r passbolt_mariadb_cert
rm -r mariadb_server_cert

bash gen_root_cert.sh root_ca 5F8qMYNVdrBhaShDYx2mcxLvLpLrDX8V

bash gen_server_cert.sh root_ca passbolt_mariadb_cert 95.217.11.108 2kSCRG9ZZcHxuayAPctTrKxTC4PMXUVH
bash gen_server_cert.sh root_ca mariadb_server_cert 95.217.11.108 83JE83yzqFcuE7wzDdxFYMA5LD4j7aP6


