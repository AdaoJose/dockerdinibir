
server {
	listen 80;
	listen [::]:80;

	server_name api.dinibir.local;

	location /{
        proxy_pass http://0.0.0.0:8080;
    }
}
