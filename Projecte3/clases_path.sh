#!/bin/bash

if [[ $# -ne 1 ]]; then
        echo "Porfavor selecciona solo un elemento"
        exit 1
fi

echo
path="$1"

if [[ -e "$path" ]]; then
        echo "El elemento $path existe"
else
        echo "Error: el elemento $path no existe"
fi
echo

echo "Estos son las caracteristicas del elemento $path"

if [[ -d "$path" ]]; then
	echo "Es un directorio: SI"
elif [[ -f "$path" ]]; then
	echo "Es un directorio: NO"
fi

if [[ -f "$path" ]]; then
	echo "Es un fichero: SI"
else
	echo "Es un fichero: NO"
fi

nombre=$(basename "$path")
extension="${nombre##*.}"

if [[ "$nombre" = "$extension" ]]; then
	echo "El fichero no tiene extension"
else
	echo "Extension del fichero: .$extension"
fi




