#!/bin/bash

# Espera hasta que el servidor MySQL esté disponible
while ! mysql -u ${USER} -p${PASS} -h ${HOST} -e ";" ; do
    sleep 1
done

# Solo importa si la tabla de usuarios está vacía
if ! mysql -u ${USER} -p${PASS} -h ${HOST} -e "SELECT 1 FROM usuarios LIMIT 1;" ${DB} >/dev/null 2>&1; then
    echo "Importando base de datos..."
    mysql -u ${USER} -p${PASS} -h ${HOST} ${DB} < /opt/biblioteca.sql
else
    echo "La base de datos ya contiene datos, no se importa."
fi

# Arranca Apache en primer plano
apache2ctl -D FOREGROUND
