#!/bin/zsh
# Verify a file with a public key using OpenSSL
# Decode the signature from Base64 format
#
# Usage: verify <file>
#
# # This is a convenience script adapted from https://gist.github.com/tcurdt/71f23af642d5ee0a1615596c2e428b4b


filename=$1
signature=$filename.sig.base64
publickey=../joshkil.github.io.pem

if [[ $# -lt 1 ]] ; then
  echo "Usage: verify <file>"
  exit 1
fi

openssl base64 -d -in $signature -out /tmp/$filename.sha256
openssl dgst -sha256 -verify $publickey -signature /tmp/$filename.sha256 $filename
rm /tmp/$filename.sha256