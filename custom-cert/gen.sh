#! /bin/sh

openssl genrsa -out localhost.key 4096
openssl req -x509 \
  -nodes \
  -days 825 \
  -key localhost.key \
  -out localhost.crt \
  -config openssl.cnf \
  -extensions req_ext
