
server {
	#listen 80 default_server;
	#listen [::]:80 default_server;

	# SSL configuration
	#
	 listen 443 ssl default_server;
	 listen [::]:443 ssl default_server;
	

	root /web;

	index index.html index.htm index.nginx-debian.html;

	server_name teste0100.com www.teste0100.com;

	location / {
		
		try_files $uri $uri/ =404;
	}
}

