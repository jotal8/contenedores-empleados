# Configuración Inicial

## Usuario Administrador  db
- **Usuario:** `unow`
- **Clave:** `holamundo`

---

## Credenciales de Aplicación
- ADMINISTRADOR
- **Correo:** `unow@correo.com`
- **Clave:** `holamundo`

- USUARIO
- **Correo:** `usuario@correo.com`
- **Clave:** `holamundo`

---


## Ingreso a contenedor
- `ssh unow@localhost -p 2222`
- `ssh jotal8@localhost -p 2200`
- **Clave:** `holamundo`
- para ingresar a email-service  `docker exec -it email-service sh`

---

- Si tienes inconvenientes con la configuración de Gmail debes ingresar con tu cuenta a la siguiente página:
- https://myaccount.google.com/u/0/apppasswords  -> para adicionar una contraseña para la aplicacion externa
- Luego configurarla en el .env de email-service 