#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Porfavor selecciona solo un archivo"
	exit 1
fi

echo
fichero="$1"

if [[ -e "$fichero" ]]; then
	echo "El fichero $fichero existe"
else
	echo "Error: el fichero $fichero no existe"
fi
echo

echo "Eston son los permisos del fichero $fichero:"

if [[ -r "$fichero" ]]; then
	echo "Permisos de lectura: SI"
else
	echo "Permisos de lectura: NO"
fi

if [[ -w "$fichero" ]]; then
        echo "Permisos de lectura: SI"
else
        echo "Permisos de lectura: NO"
fi

if [[ -x "$fichero" ]]; then
        echo "Permisos de lectura: SI"
else
        echo "Permisos de lectura: NO"
fi

