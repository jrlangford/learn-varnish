#!/bin/bash
echo "Launching web server"
docker run -d -p 8080:80 -v /app:/var/www/html --name lamp dell/lamp

echo "Launching Varnish"
docker run -d --link lamp:backend-host -v $(pwd):/data --env 'VCL_CONFIG=/data/varnish.vcl' -p 80:80 --name varnish million12/varnish
