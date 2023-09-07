#!/bin/bash

# Install Docker
apt-get update
apt-get install -y awscli jq docker.io nginx

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Instal Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# Create a directory for the Docker Compose file
mkdir /opt/smarthome
cd /opt/smarthome || exit

# Create dependent folders
mkdir -p /etc/homeassistant
mkdir -p /etc/nodered

# Fetch SSL certificates
aws s3 cp s3://"${BUCKET_NAME}"/certificates/fullchain_pem /etc/ssl/certs/fullchain.example.com.pem
aws s3 cp s3://"${BUCKET_NAME}"/certificates/private_key_pem /etc/ssl/certs/example.com.pk.pem

# Fetch pre-defined configuration files for applications
aws s3 cp s3://"${BUCKET_NAME}"/config/home_assistant/configuration.yaml /etc/homeassistant/config/configuration.yaml
aws s3 cp s3://"${BUCKET_NAME}"/config/home_assistant/settings.conf /etc/hassconf/config/settings.conf
aws s3 cp s3://"${BUCKET_NAME}"/config/mosquitto/mosquitto.conf /etc/mosquitto/config/mosquitto.conf

# Fetch docker compose files
aws s3 cp s3://"${BUCKET_NAME}"/applications.yml /opt/smarthome/applications.yml

# Start the application using Docker Compose
docker-compose -f /opt/smarthome/applications.yml up -d

# Change dependencies of NodeRed folder
sudo chown -R 1000:1000 /etc/nodered

# Install HACS
cd /etc/homeassistant/config || exit
wget -O - https://get.hacs.xyz | bash -

# Configure Nginx
sudo tee /etc/ssl-nginx.conf >/dev/null <<'EOF'
ssl_session_cache shared:le_nginx_SSL:10m;
ssl_session_timeout 1440m;
ssl_session_tickets off;

ssl_protocols TLSv1.2 TLSv1.3;
ssl_prefer_server_ciphers off;

ssl_ciphers "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384";
EOF

sudo tee /etc/nginx/conf.d/example.com.conf >/dev/null <<'EOF'
map $http_upgrade $connection_upgrade {
    default upgrade;
    ''      close;
}
server {
    listen 80;
    server_name example.com www.example.com;

    # Redirect HTTP to HTTPS
    return 301 https://$host$request_uri;
}
server {
    listen 443 ssl;
    server_name example.com www.example.com;

    # SSL certificate and key paths
    ssl_certificate /etc/ssl/certs/fullchain.example.com.pem;
    ssl_certificate_key /etc/ssl/certs/example.com.pk.pem;

    # Prevent nginx HTTP Server Detection
    server_tokens off;

    # Remove X-Powered-By, which is an information leak
    fastcgi_hide_header X-Powered-By;

    # The settings allow you to optimize the HTTP/2 bandwidth
    client_body_buffer_size 512k;

    access_log /var/log/nginx/example.com-access.log;
    error_log /var/log/nginx/example.com-error.log;

    location / {
        proxy_pass http://localhost:8123/;
        proxy_set_header Host $host;
        proxy_ssl_server_name on;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header X-Forwarded-Host $server_name;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_read_timeout 90;
    }
}
EOF

# Restart Nginx
sudo rm -f /etc/nginx/conf.d/default.conf
sudo systemctl restart nginx
sudo /lib/systemd/systemd-sysv-install enable nginx
