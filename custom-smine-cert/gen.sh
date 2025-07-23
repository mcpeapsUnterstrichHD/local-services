#!/bin/bash

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

# Check if Homebrew is installed
if ! command -v brew >/dev/null 2>&1; then
  echo "❌ Homebrew ist nicht installiert. Bitte installiere Homebrew zuerst: https://brew.sh"
  exit 1
fi

echo "✅ Homebrew ist installiert."

# Check if mkcert is installed
if ! command -v mkcert >/dev/null 2>&1; then
  echo "📦 mkcert wird installiert..."
  brew install mkcert
else
  echo "✅ mkcert ist bereits installiert."
fi

# Check if nss is installed (needed for Firefox trust store)
if ! brew list nss >/dev/null 2>&1; then
  echo "📦 nss wird installiert..."
  brew install nss
else
  echo "✅ nss ist bereits installiert."
fi



for EMAIL in "${EMAILS[@]}"; do
  SAFE_NAME=$(echo "$EMAIL" | tr '@' '_' | tr '.' '_')
  mkdir -p "$OUTPUT_DIR/$SAFE_NAME"
  # Generate certificate
  echo "🔧 Erzeuge Zertifikat für: $EMAIL"
  mkcert -key-file "$OUTPUT_DIR/$SAFE_NAME/$SAFE_NAME.key" -cert-file "$OUTPUT_DIR/$SAFE_NAME/$SAFE_NAME.crt" -p12-file "$OUTPUT_DIR/$SAFE_NAME.p12" -pkcs12 -install "$EMAIL"

  echo "✅ Zertifikat erstellt: $OUTPUT_DIR/$SAFE_NAME.p12"
  echo ""
done

echo "🎉 Alle Zertifikate wurden erfolgreich erstellt im Ordner: $OUTPUT_DIR"