# #!/bin/bash

# # Directorios del proyecto
# BACKEND_DIR=~/deploy/backend
# FRONTEND_DIR=~/deploy/frontend

# # 1. Actualizar código del repositorio
# cd $BACKEND_DIR
# git pull origin main

# cd $FRONTEND_DIR
# git pull origin main

# # 2. Backend (Django): Instalar dependencias y migrar base de datos
# cd $BACKEND_DIR
# python3 -m venv venv
# source venv/bin/activate
# pip install -r requirements.txt
# python manage.py migrate
# python manage.py collectstatic --noinput

# # 3. Frontend (React): Crear build
# cd $FRONTEND_DIR
# npm install
# npm run build

# # 4. Mover el build de React al directorio de Django staticfiles
# cp -r $FRONTEND_DIR/build/* $BACKEND_DIR/static/

# # 5. Reiniciar servicios (asegúrate de configurar Gunicorn o el WSGI adecuado)
# sudo systemctl restart gunicorn
# sudo systemctl restart nginx
