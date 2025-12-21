#!/bin/bash

fichero="palabras.txt"

if [ ! -f "$fichero" ]; then
    touch "$fichero"
    echo "Se a creado el archivo $fichero"
fi

echo "Introduce palabras (tienes que escribir :> para finalizar):"

while true; do
    read palabra

    if [ "$palabra" = ":>" ]; then
        echo "Fin del programa."
        break
    else
        echo "$palabra" >> "$fichero"
    fi
done
