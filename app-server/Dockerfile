FROM php:7.4-apache

RUN mkdir -p /var/www/html

ENV TZ=America/Bogota
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY virtualhost.conf /etc/apache2/sites-available/virtualhost.conf
COPY php.ini /usr/local/etc/php/php.ini

RUN a2ensite virtualhost.conf;
RUN a2enmod rewrite headers
RUN a2dissite 000-default.conf

RUN apt-get update && \
    apt-get upgrade -y

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://get.symfony.com/cli/installer | bash \
    &&  mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

#Se instala GIT

RUN apt-get -y install \
git && \
git config --global core.fileMode false && \
git config --global user.name "Julian Otalvaro" && \
git config --global user.email jotal8@gmail.com && \
git config --global alias.s "status -s -b" && \
git config --global alias.lg "log --oneline --decorate --all --graph"

# Se instala Node.js versión 20
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
    RUN apt-get install -y nodejs

# Se Instala las librerias necesarias
RUN apt-get install -y vim
RUN apt-get install -y libexif-dev #exif
RUN apt-get install -y libicu-dev #intl
RUN apt-get install -y libxml2-dev #soap
RUN apt-get install -y zlib1g-dev libzip-dev #zip
RUN apt-get install -y libldap2-dev #ldap
RUN apt-get install -y libc-client-dev libkrb5-dev #imap
RUN apt-get install -y libgd-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev #GD
RUN apt-get install -y unzip libaio1 #OCI

# Instala las dependencias necesarias
RUN docker-php-ext-install exif intl soap zip pdo pdo_mysql mysqli

# Configura e instala las extensiones de LDAP
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap

# Configura e instala las extensiones de IMAP
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install imap

## Configura e instala las extensiones de GD
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd

# Instala SSH
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    echo 'root:saia' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/' /etc/ssh/sshd_config

# Crear un nuevo usuario SSH
RUN useradd -g www-data -m jotal8
RUN usermod --shell /bin/bash jotal8
RUN chown -R jotal8:www-data /home/jotal8
RUN chown -R jotal8:www-data /var/www/html

# Cambia la contraseña
RUN echo 'jotal8:holamundo' | chpasswd

# Cambiar el usuario y grupo con el que Apache se ejecuta
RUN sed -i 's/APACHE_RUN_USER:=www-data/APACHE_RUN_USER:=jotal8/' /etc/apache2/envvars

# Establecer el usuario y grupo www-data para el directorio de documentos
RUN chown -R jotal8:www-data /var/www/html

# Expon el puerto 22 para SSH
EXPOSE 22

# Copia el script de entrada al contenedor
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
# Asegúrate de que el script sea ejecutable
RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["/usr/local/bin/entrypoint.sh"]





