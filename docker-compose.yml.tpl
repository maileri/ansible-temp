version: '2'
services:
  web:
    image: odoo:12.0
    restart: always
    depends_on:
      - {{dbname}}
    ports:
      - "{{odoo_port}}:8069"
    volumes:
      - /data/{{domain}}/web-data:/var/lib/odoo:z
      - /data/{{domain}}/config:/etc/odoo:z
      - /data/{{domain}}/addons:/mnt/extra-addons:z
    environment:
      - DB_HOST=10.140.69.31
      - DB_USER={{dbuser}}
      - DB_PASS={{dbpassword}}
      - DB_NAME={{dbname}}
      - ADMIN_PASSWD=# set me
  {{dbname}}:
    image: postgres:10
    restart: always
    environment:
      - POSTGRES_PASSWORD={{dbpassword}}
      - POSTGRES_USER={{dbuser}}
      - PGDATA=/var/lib/postgresql/data/pgdata
    volumes:
      - /data/{{domain}}/db-data:/var/lib/postgresql/data/pgdata:z
