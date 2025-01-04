# Configuración Inicial

Para asegurar una instalación correcta, se deben ejecutar los siguientes pasos en el orden indicado:

- Clonar el repositorio: 
git clone https://github.com/jotal8/contenedores-empleados

Ejecutar el siguiente comando para configurar la contraseña de root de MySQL:

- export MYSQL_ROOT_PASSWORD=la_contraseña_de_root


Levantar los contenedores con Docker: 


# Instalación nueva 
Sólo en caso de no haber realizado el intento de instalación previamente:

- docker-compose up -d

# Reinstalación: 
Sólo si se ejecutó los comandos de creación de imagen y contenedores anteriormente

Eliminar los contenedores previamente instalados:
- docker rm app-server -f
- docker rm website -f
- docker rm email-service -f
- docker rm db-server -f

Eliminar las imagenes previamente instaladas:
- docker rmi project-app-server
- docker rmi project-website
- docker rmi project-email-service
- docker rmi mysql:8.0
 
Eliminar los volúmenes inicializados anteriormente:
- docker volume rm project_mysql_data
- docker volume rm project_project_code
- docker volume rm project_project_email
- docker volume rm project_project_website

Ejecutar el siguiente comando para limpiar cache de instalaciones previas: 
- docker builder prune -a

- docker-compose up -d
			
Nota: En caso de fallar, sucede porque intenta acceder al caché que ya no se encuentra disponible, en este caso volver a ejecutarlo nuevamente.
En el caso de no funcionar ejecutar los siguientes dos comandos:

- docker-compose build --no-cache
- docker-compose up -d

## Ejecución de la Aplicación

- ingresar al navegador e ingresar a localhost

---

## Credenciales de Aplicación
- ADMINISTRADOR
 **Correo:** `unow@correo.com`
 **Clave:** `holamundo`

- USUARIO
 **Correo:** `usuario@correo.com`
 **Clave:** `holamundo`

---


## Ingreso a contenedor
- `ssh unow@localhost -p 2222`
- `ssh jotal8@localhost -p 2200`
- **Clave:** `holamundo`
- para ingresar a email-service  `docker exec -it email-service sh`

---

# CONFIGURACIÓN DE ENVÍO DE EMAIL
Ingresar al contendor con el siguiente comando al servicio de email:

docker exec -it email-service sh

Modificar las variables de usuario y contraseña del servidor de correo en el archivo 

apt-get update
apt-get install vim

vim /app/.env

y con la letra i se puede editar las variables EMAIL_PASSWORD, CORREO, SERVER Y PORT

posteriormente ejecutar :wq para guardar los cambios.


- Si tienes inconvenientes con la configuración de Gmail debes ingresar con tu cuenta a la siguiente página:
- https://myaccount.google.com/u/0/apppasswords  -> para adicionar una contraseña para la aplicacion externa
- Luego configurarla en el .env de email-service 