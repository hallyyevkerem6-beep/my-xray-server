#!/bin/sh

# Xray indirme ve kurma
wget -O /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
unzip /tmp/xray.zip -d /usr/local/bin/
chmod +x /usr/local/bin/xray

# Xray konfigürasyon dosyası oluşturma
cat <<EOF > /etc/xray_config.json
{
  "inbounds": [
    {
      "port": ${PORT},
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "${UUID}"
          }
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": "/vless-ws"
        }
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF

# Xray çalıştırma
/usr/local/bin/xray -config /etc/xray_config.json
