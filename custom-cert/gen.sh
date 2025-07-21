#! /bin/sh

openssl genrsa -out localhost.key 4096
openssl req -x509 \
  -nodes \
  -days 825 \
  -key localhost.key \
  -out localhost.crt \
  -config openssl.cnf \
  -extensions req_ext
openssl pkcs12 -export \
-out localhost.p12 \
-inkey localhost.key \
-in localhost.crt \
-name "localhost" \
-passout pass: