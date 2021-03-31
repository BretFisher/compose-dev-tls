#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Creates a self-signed wildcard cert for local test and dev
# it always adds localhost and *.localhost, but can also add
# any domain you add to CLI

# EXAMPLE for *.localhost only: ./cert.sh
# EXAMPLE for *.localhost plus *.something.com: ./cert.sh something.com

# three files are created:
# cert.key - Secret key good for proxy configs
# cert.crt - Public cert good for proxy configs
# cert.pem - Combo of those two good for browser/OS import

if [ ! -f cert.key ]; then

  DOMAIN_NAME=$1

  if [ -n "$1" ]; then
    echo "You supplied domain $1"
    SAN_LIST="[SAN]\nsubjectAltName=DNS:localhost, DNS:*.localhost, DNS:*.$DOMAIN_NAME, DNS:$DOMAIN_NAME"
    printf $SAN_LIST
  else
    echo "No additional domains will be added to cert"
    SAN_LIST="[SAN]\nsubjectAltName=DNS:localhost, DNS:*.localhost"
    printf $SAN_LIST
  fi

  openssl req \
    -newkey rsa:2048 \
    -x509 \
    -nodes \
    -keyout "cert.key" \
    -new \
    -out "cert.crt" \
    -subj "/CN=compose-dev-tls Self-Signed" \
    -reqexts SAN \
    -extensions SAN \
    -config <(cat openssl.cnf <(printf $SAN_LIST)) \
    -sha256 \
    -days 3650

  cat "cert.crt" "cert.key" > "cert.pem"
  echo "new TLS self-signed certificate created"

else

  echo "certificate files already exist. Skipping"

fi
