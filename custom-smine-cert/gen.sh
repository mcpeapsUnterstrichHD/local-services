#!/bin/bash

# =============================
# Self-Signed S/MIME Zertifikate Generator
# Autor: ChatGPT (für Fabian Aps)
# Gültigkeit: 30 Jahre (10950 Tage)
# =============================

set -e

EMAILS=(
  "mcpeaps_HD@outlook.com"
  "aps.fabian@icloud.com"
  "aps.fabian@mcpeapsunterstrichhd.dev"
  "mcpeaps_hd@mcpeapsunterstrichhd.dev"
  "mahd@mcpeapsunterstrichhd.dev"
  "mcpeaps_hd@comboompunktsucht.app"
  "mahd@comboompunktsucht.app"
  "comboom.sucht@outlook.de"
  "comboom.sucht@gmail.com"
  "comboom.sucht@comboompunktsucht.app"
  "cbps@comboompunktsucht.app"
)

OUTPUT_DIR="."
DAYS_VALID=10950  # 30 Jahre



for EMAIL in "${EMAILS[@]}"; do
  SAFE_NAME=$(echo "$EMAIL" | tr '@' '_' | tr '.' '_')
  CN="$EMAIL"
  NAME="S/MIME Cert for $EMAIL"

  mkdir -p "$OUTPUT_DIR/$SAFE_NAME"

  echo "🔧 Erzeuge Zertifikat für: $EMAIL"

  openssl genrsa -out "$OUTPUT_DIR/$SAFE_NAME/$SAFE_NAME.key.pem" 4096

  openssl req -new -key "$OUTPUT_DIR/$SAFE_NAME/$SAFE_NAME.key.pem" \
    -subj "/C=DE/ST=Berlin/L=Berlin/O=Privat/CN=$CN/emailAddress=$EMAIL" \
    -out "$OUTPUT_DIR/$SAFE_NAME/$SAFE_NAME.csr.pem"

  openssl x509 -req -days $DAYS_VALID \
    -in "$OUTPUT_DIR/$SAFE_NAME/$SAFE_NAME.csr.pem" \
    -signkey "$OUTPUT_DIR/$SAFE_NAME/$SAFE_NAME.key.pem" \
    -out "$OUTPUT_DIR/$SAFE_NAME/$SAFE_NAME.crt.pem" \
    -extensions usr_cert \
    -extfile <(cat <<EOF
[usr_cert]
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment
extendedKeyUsage = emailProtection
subjectAltName = email:$EMAIL
EOF
)

  openssl pkcs12 -export \
    -inkey "$OUTPUT_DIR/$SAFE_NAME/$SAFE_NAME.key.pem" \
    -in "$OUTPUT_DIR/$SAFE_NAME/$SAFE_NAME.crt.pem" \
    -out "$OUTPUT_DIR/$SAFE_NAME.p12" \
    -name "$NAME" \
    -passout pass:

  echo "✅ Zertifikat erstellt: $OUTPUT_DIR/$SAFE_NAME.p12"
  echo ""
done

echo "🎉 Alle Zertifikate wurden erfolgreich erstellt im Ordner: $OUTPUT_DIR"