#!/bin/bash

while true; do
    echo "----- MENU -----"
    echo "1) Mostrar fecha y hora actual"
    echo "2) Comprovar si existe un fichero"
    echo "3) Salir"
    echo "----------------"

    read -p "Selecciona una opcion: " opcion
    echo

    case $opcion in
        1)
            echo "Fecha y hora actual:"
            date
            ;;
        2)
            read -p "Introduce el nombre del fichero: " fichero
            if [ -e "$fichero" ]; then
                echo "El fichero existe."
            else
                echo "El fichero NO existe."
            fi
            ;;
        3)
            echo "Salir del programa. Nos vemos a la proxima :D!"
            break
            ;;
        *)
            echo "Error: opcion no valida."
            ;;
    esac

    echo
done
