server {
    listen 80;

    server_name {{domain}};

    return 301 https://{{domain}}$request_uri;
}
server {
        listen 443 ssl;

        server_name {{domain}};

location / {
        root  /home/domains/{{domain}}/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#       proxy_set_header X-Forwarded-Proto $scheme;
        proxy_pass http://10.140.69.23:{{odoo_port}};
}
        access_log /var/log/nginx/https-{{domain}}-access.log main;
        error_log /var/log/nginx/https-{{domain}}-error.log;

       

        # Max upload size: make sure this matches the php.ini in .htaccess
         client_max_body_size 32m;




  ssl on;
  ssl_certificate     /etc/pki/tls/certs/tahti.netorek.cloud.crt;
  ssl_certificate_key /etc/pki/tls/private/tahti.netorek.cloud.key;

  resolver 127.0.0.1;
  ssl_stapling on;

  ssl_session_cache shared:SSL:50m;
  ssl_session_timeout  5m;
  ssl_protocols  TLSv1 TLSv1.1 TLSv1.2;

ssl_ciphers "ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA:ECDHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES128-SHA256:DHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA:DES-CBC3-SHA:HIGH:!aNULL:!eNULL:!EXPORT:!DES:!MD5:!PSK:!RC4";
  
  ssl_prefer_server_ciphers on;
  
  add_header Strict-Transport-Security "max-age=31536000; includeSubdomains;";
#ssl_dhparam /etc/ssl/certs/dhparam.pem;


} # End server
