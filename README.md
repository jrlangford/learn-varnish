#Learn Varnish

A repo with Varnish setup examples to serve as a personal guide.

##Basic Varnish setup

* Launch  a web server
```
$ docker run -d -p 8080:80 -v /app:/var/www/html --name lamp dell/lamp
```

* Launch varnish
```
docker run -d --link lamp:backend-host -v $(pwd):/data --env 'VCL_CONFIG=/data/varnish.vcl' -p 80:80 --name varnish million12/varnish
```

* Test a request
```
curl -I http://localhost:80
```
