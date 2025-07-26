#! /bin/sh

#openssl genrsa -out localhost.key 4096
#openssl req -x509 \
#  -nodes \
#  -days 825 \
#  -key localhost.key \
#  -out localhost.crt \
#  -config openssl.cnf \
#  -extensions req_ext
#openssl pkcs12 -export \
#-out localhost.p12 \
#-inkey localhost.key \
#-in localhost.crt \
#-name "localhost" \
#-passout pass:

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

# Generate certificate
echo "📄 Zertifikat wird erstellt..."
mkcert -key-file localhost.key -cert-file localhost.crt -p12-file localhost.p12 -install localhost "*.localhost" 127.0.0.1 ::1

echo "✅ Zertifikat erfolgreich erstellt."