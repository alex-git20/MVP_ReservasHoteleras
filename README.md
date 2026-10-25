# Sistema de Reservas de Hotel (MVP)
**MVP funcional de reservas hoteleras (Proyecto Universitario). Demuestra competencias Full-Stack integrando Node.js, Express, PostgreSQL y Bootstrap 5.**

## Requisitos previos
- Node.js instalado.
- PostgreSQL (pgAdmin).

## Instalación y Configuración

1. **Clonar el repositorio e instalar dependencias:**
   Abre tu terminal y ejecuta:
   ```bash
   git clone <URL_DE_TU_REPOSITORIO>
   cd <NOMBRE_DE_LA_CARPETA>
   npm install

## Configurar las variables de entorno:
1. **Crea un archivo .env en la raíz del proyecto basándote en tus credenciales:**
    DB_USER=tu_usuario
    DB_PASSWORD=tu_password
    DB_HOST=localhost
    DB_PORT=5432
    DB_NAME=hotel

## Restaurar la base de datos:
1. Abre pgAdmin y crea una base de datos vacía llamada hotel.
2. Abre la herramienta Query Tool en esa base de datos.
3. Pega el contenido del archivo backup_hotel.sql y ejecútalo para crear las tablas e insertar los datos.

## Iniciar el servidor:
   1. **En la terminal del proyecto, ejecuta:**
    node index.js