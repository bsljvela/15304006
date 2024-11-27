#!/bin/bash
set -e

# Esperar a la base de datos (opcional)
until nc -z -v -w30 db 3306; do
  echo "Esperando a que MySQL esté disponible..."
  sleep 1
done
echo "¡Base de datos disponible!"

# Ejecutar migraciones
python manage.py migrate

# Recolectar archivos estáticos
python manage.py collectstatic --noinput

# Ejecutar el servidor
exec "$@"
