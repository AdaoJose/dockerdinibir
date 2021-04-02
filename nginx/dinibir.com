
server {

	# SSL configuration
	#
	 #listen 443 ssl default_server;
	 #listen [::]:443 ssl default_server;
	

	root /web;

	index index.html index.htm index.nginx-debian.html;

	server_name dinibir.com www.dinibir.com;

	location / {
		
		try_files $uri $uri/ =404;
	}

    listen [::]:443 ssl ipv6only=on; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/dinibir.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/dinibir.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}


server {
    if ($host = dinibir.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


	listen 80 default_server;
	listen [::]:80 default_server;

	server_name dinibir.com www.dinibir.com;
    return 404; # managed by Certbot


}