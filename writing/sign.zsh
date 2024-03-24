#!/bin/zsh
# Sign a file with a private key using OpenSSL
# Encode the signature in Base64 format
#
# Usage: sign <file>
#
# This is a convenience script adapted from https://gist.github.com/tcurdt/71f23af642d5ee0a1615596c2e428b4b

filename=$1
privatekey=../../rsa_priv.pem

if [[ $# -lt 1 ]] ; then
  echo "Usage: sign <file>"
  exit 1
fi

openssl dgst -sha256 -sign $privatekey -out /tmp/$filename.sha256 $filename
openssl base64 -in /tmp/$filename.sha256 -out $filename.sig.base64
rm /tmp/$filename.sha256