#!/bin/bash

if [[ "$#" -ne 2 ]]; then
	echo "Porfavor has la seleccion de solo un fichero y una palabra"
	exit 1
fi

fichero="$1"
palabra="$2"

if [[ ! -f "$fichero" ]]; then
	echo "Error: el fichero $fichero no existe."
	exit 1
fi

if [[ "$fichero" != *.txt && "$fichero" != *.csv ]]; then 
	echo "El fichero seleccionado no cumple con las extensiones permitidas (.txt o .csv)"
	exit 1
fi

coincidencias=$(grep -i -c "$palabra" "$fichero")

if [[ "$coincidencias" -gt 0 ]]; then
	echo "Hay un total de $coincidencias coincidencias en el fichero"
else
	echo "No se han encontrado coincidencias en el fichero ($fichero)"
fi
