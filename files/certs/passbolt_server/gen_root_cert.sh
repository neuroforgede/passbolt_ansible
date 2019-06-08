#!/bin/bash

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

BASEDIR="$1"
LOGGING_PREFIX="gen_root_cert.sh >> "

PASSKEY="$2"

mkdir -p $BASEDIR

rm -f ${BASEDIR}/rootCA.crt
rm -f ${BASEDIR}/rootCA.csr
rm -f ${BASEDIR}/rootCA.key
rm -f ${BASEDIR}/rootCA.srl

echo "$PASSKEY" > ${BASEDIR}/passkey.txt

# generate a key for our root CA certificate
echo "${LOGGING_PREFIX} Generating key for root CA certificate"
openssl genrsa -des3 -passout pass:${PASSKEY} -out ${BASEDIR}/rootCA.pass.key 4096
openssl rsa -passin pass:${PASSKEY} -in ${BASEDIR}/rootCA.pass.key -out ${BASEDIR}/rootCA.key
rm ${BASEDIR}/rootCA.pass.key
echo

# create and self sign the root CA certificate
echo
echo "${LOGGING_PREFIX} Creating self-signed root CA certificate"
openssl req -x509 -new -nodes -key ${BASEDIR}/rootCA.key -sha512 -days 36500 -out ${BASEDIR}/rootCA.crt -subj "/emailAddress=test@your-domain.de/C=DE/ST=State/L=City/O=Organisation/OU=Organisation-dev/CN=Organisation-CA" -extensions v3_ca
echo "${LOGGING_PREFIX} Self-signed root CA certificate (${BASEDIR}/rootCA.crt) is:"
openssl x509 -in ${BASEDIR}/rootCA.crt -text -noout
echo
