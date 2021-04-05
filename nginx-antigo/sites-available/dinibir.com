
server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root /web;

	index index.html index.htm index.nginx-debian.html;

	server_name dinibir.com www.dinibir.com;

	location / {
		
		try_files $uri $uri/ =404;
	}


}


