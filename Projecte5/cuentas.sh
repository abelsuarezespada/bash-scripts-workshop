#!/bin/bash

obtener_usarios() {
    cut -d: -f1 /etc/passwd | grep '[A-Z]'
}

mostrar_informacion() {
    local usuario=$1
    info_usuario=$(getent passwd "$usuario")

    if [[ -n "$info_usuario" ]]; then
        echo "Información del usuario '$usuario':"
        nombre_completo=$(echo "$info_usuario" | cut -d: -f5)
        directorio=$(echo "$info_usuario" | cut -d: -f6)
        shell=$(echo "$info_usuario" | cut -d: -f7)
        uid=$(echo "$info_usuario" | cut -d: -f3)
        gid=$(echo "$info_usuario" | cut -d: -f4)

        echo "Nombre completo: $nombre_completo"
        echo "Directorio inicial: $directorio"
        echo "Shell: $shell"
        echo "UID: $uid"
        echo "GID: $gid"
    else
        echo "Error: El usuario '$usuario' no existe."
    fi
}

usuariosM=$(obtener_usarios)

echo "Usuarios con mayúsculas en el sistema:"
echo "$usuariosM"
echo

while true; do
    read -p "Introduce un nombre de usuario: " usuario

    if [[ "$usuariosM" == *"$usuario"* ]]; then
        mostrar_informacion "$usuario"
        break
    else
        echo "Error: El usuario '$usuario' no es válido o no tiene mayúsculas en el nombre."
    fi
done
