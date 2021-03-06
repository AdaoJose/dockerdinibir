FROM php:7.4.16
# Atualizando as dependĂȘncias e instalando as mais comĂșns
RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common vim curl debconf subversion git apt-transport-https apt-utils \
    build-essential locales acl mailutils wget zip unzip \
    gnupg gnupg1 gnupg2 \
    zlib1g-dev \
    libxml2-dev \
    sudo

# Instalando o Composer
RUN curl -sSk https://getcomposer.org/installer | php -- --disable-tls && \
	mv composer.phar /usr/local/bin/composer
RUN wget https://get.symfony.com/cli/installer -O - | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony
RUN git config --global user.name "Adaojose"
RUN git config --global user.email "adao.jose123.a.r@gmail.com"

# RUN ln -s /etc/nginx/sites-available/dinibir.com /etc/nginx/sites-enabled/dinibir.com
# RUN service nginx start
# RUN service nginx reload
#RUN certbot --nginx -d dinibir.com -d api.dinibir.com
