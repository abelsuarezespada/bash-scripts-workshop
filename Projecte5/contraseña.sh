#!/bin/bash

while true; do
    read -p "Introduce una contraseña: " password

    errores=0

    if [ ${#password} -lt 8 ]; then
        echo "Error: la contraseña tiene que tener almenos 8 caracteres."
        errores=1
    fi

    if ! [[ "$password" =~ [A-Z] ]]; then
        echo "Error: la contraseña tiene que contener almenos una letra mayuscula."
        errores=1
    fi

    if ! [[ "$password" =~ [0-9] ]]; then
        echo "Error: la contraseña tiene que contener almenos un numero."
        errores=1
    fi

    if [ $errores -eq 0 ]; then
        echo "Contraseña valida"
        break
    else
        echo "Vuelve a intentarlo."
        echo
    fi
done
