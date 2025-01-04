#!/bin/bash

echo "Esperando a que el servicio de la base de datos se inicie..."
sleep 20

# Ejecutar los comandos de Symfony
/var/www/html/project/bin/console doctrine:schema:create
/var/www/html/project/bin/console app:install:initialData

# Iniciar servicio SSH
service ssh start

# Iniciar Apache en primer plano
apache2-foreground