#!/usr/bin/env bash
# Configures Nginx server to serve a page containing "Holberton School"

# Update package list
apt-get update -y

# Install Nginx
apt-get install nginx -y

# Create a simple HTML page with "Holberton School"
echo "Holberton School" > /var/www/html/index.html

# Configure Nginx to listen on port 80
cat > /etc/nginx/sites-available/default <<INNER_EOF
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    
    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;
    
    server_name _;
    
    location / {
        try_files \$uri \$uri/ =404;
    }
}
INNER_EOF

# Start Nginx service
service nginx start

# Restart Nginx to apply changes
service nginx restart
