# Utiliza la imagen oficial de Python para Django
FROM python:3.10-slim AS backend

# Establecer directorio de trabajo para el backend
WORKDIR /app

# Instalar dependencias necesarias para Python y MySQL
RUN apt-get update && apt-get install -y --no-install-recommends \
    default-libmysqlclient-dev build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copiar el archivo de dependencias e instalar
COPY backend/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el proyecto de Django
COPY backend /app

# Configurar la imagen para ejecutar Django
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Copiar el script de inicio al contenedor
COPY entrypoint.sh /app/entrypoint.sh

# Configurar el script como punto de entrada
ENTRYPOINT ["sh", "/app/entrypoint.sh"]

# Comando por defecto para iniciar Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# --- Construcción del Frontend ---
FROM node:18 AS frontend

# Establecer directorio de trabajo para el frontend
WORKDIR /frontend

# Copiar archivos del frontend
COPY frontend/package*.json /frontend/
RUN npm install

# Copiar el resto del código del frontend y construir
COPY frontend /frontend
RUN npm run build

# Servir la aplicación React estática con NGINX
FROM nginx:alpine AS production

# Copiar el build de React al directorio de NGINX
COPY --from=frontend /frontend/dist /usr/share/nginx/html

# Exponer el puerto 80
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
