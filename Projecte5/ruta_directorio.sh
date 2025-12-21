#!/bin/bash

until [ -d "$directori" ]; do
    read -p "Introdueix la ruta d'un directori: " directori

    if [ ! -d "$directori" ]; then
        echo "Error: El directori '$directori' no existeix. Intenta-ho de nou."
    fi
done

permisos=$(ls -ld "$directori" | awk '{print $1}')
echo "Permisos del directori '$directori': $permisos"

arxius=0
carpetes=0

for element in "$directori"/*; do
    if [ -f "$element" ]; then
        arxius=$((arxius + 1))
    elif [ -d "$element" ]; then
        carpetes=$((carpetes + 1))
    fi
done

echo "Número d'arxius: $arxius"
echo "Número de carpetes: $carpetes"

echo "Arxius dins del directori '$directori':"
for arxiu in "$directori"/*; do
    if [ -f "$arxiu" ]; then
        echo "$(basename "$arxiu")"
    fi
done

echo "Carpetes dins del directori '$directori':"
for carpeta in "$directori"/*; do
    if [ -d "$carpeta" ]; then
        echo "$(basename "$carpeta")"
    fi
done
