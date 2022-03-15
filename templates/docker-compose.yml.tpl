version: '2'
services:
  web:
    image: odoo:11
    restart: always
    ports:
      - "{{odoo_port}}:8069"
    volumes:
      - /data/{{domain}}/web-data:/var/lib/odoo:z
      - /data/{{domain}}/config:/etc/odoo:z
      - /data/{{domain}}/addons:/mnt/extra-addons:z
    environment:
      - DB_HOST=10.140.68.31
      - DB_PORT_5432_TCP_ADDR=10.140.68.31
      - DB_USER={{dbuser}}
      - DB_ENV_POSTGRES_USER={{dbuser}}
      - DB_PASS={{dbpassword}}
      - DB_ENV_POSTGRES_PASSWORD={{dbpassword}}
      - DB_NAME={{dbname}}
      - ADMIN_PASSWD=Lupiini.16
