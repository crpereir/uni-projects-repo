#!/bin/bash

### Generate a configuration template.
cat << END
upstream tvsapp {
#add-text-here
}

server {
    listen 12021 default_server;
    server_name _;

    location / {
        proxy_pass http://tvsapp/;
        proxy_set_header Host \$host;
    }
}
END
