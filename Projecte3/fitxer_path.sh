#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Error: mal uso del programa porfavor introdusca solo un argumento"
fi

fichero="$1"

if  [[ -e "$fichero" ]]; then
	echo "El fichero designado ($fichero) existe"
else
	echo "Error: el fichero '$fichero' no existe"
fi

tipus=$(file --brief "$fichero")

echo "Tipo de fichero: $tipus"
