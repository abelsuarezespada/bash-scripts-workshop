#!/bin/bash

if [[ $# -ne 2 ]]; then
        echo "Porfavor selecciona solo dos elementos"
        exit 1
fi

echo
directorio="$1"
fichero="$2"

if [[ -e "$directorio" ]]; then
        echo "El elemento $directorio existe"
else
        echo "Error: el elemento $directorio no existe"
	exit 1
fi
echo
if [[ -d "$directorio" ]]; then
        echo "Es un directorio: SI"
elif [[ -f "$directorio" ]]; then
        echo "Es un directorio: NO"
	echo
	echo "Error en el proceso"
	exit 1
fi
echo
if [[ -e "$fichero" ]]; then
	echo "El fichero solicitado ya existe, desea sobreexcribirlo? (S/N):"
	read respuesta
	if [[ "$respuesta" == "S" ]]; then
		echo "Comprimiendo $fichero en el directorio ($directorio):"
		tar -czf "$fichero" -C "$(dirname "$directorio")" "$(basename "$directorio")"
		mv "$fichero" "$directorio"
	elif [[ "$respuesta" == "N" ]]; then
		echo "De acuerdo cancelando operacion"
		exit 1
	fi
elif [[ ! -e "$fichero" ]]; then
	echo "Ha seleccionado el fichero ($fichero) no existente, se creara uno en su lugar."
	echo "Comenzando el proceso de compresion"
	tar -czf "$fichero" -C "$(dirname "$directorio")" "$(basename "$directorio")"
	mv "$fichero" "$directorio"
fi

