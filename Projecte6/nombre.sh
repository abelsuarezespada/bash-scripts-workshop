#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 nombre_usuario"
    exit 1
fi

usuario="$1"

echo "Selecciona una opcion:"
echo "1) Comprobar si el usuario tiene permisos de administrador"
echo "2) Comprobar si el usuario existe"
echo "3) Comprobar si el directorio personal existe"
read -p "Opcion: " opcion

case $opcion in
	1)
		if id "$usuario" &>/dev/null && groups "$usuario" | grep -q "\bsudo\b"; then
			echo "El usuario $usuario tiene permisos de administrador"
		else
			echo "El usuario $usuario no tiene permisos de administrador."
		fi
		;;
	2)
		if id "$usuario" &>/dev/null; then
			echo "El usuario $usuario existe."
		else
            echo "El usuario $usuario no existe."
        fi
        ;;
    3)
        directorio_home=$(getent passwd "$usuario" | cut -d: -f6)
        if [ -d "$directorio_home" ]; then
            echo "El directorio personal $directorio_home existe."
        else
            echo "El directorio personal no existe o no es valido."
        fi
        ;;
    *)
        echo "Opcion no valida."
        ;;
esac
