#!/bin/bash

echo "Porfavor introduce un numero:"
read numero

if [[ $numero -gt 0 ]]; then
	echo "El numero es positivo"
elif [[ $numero -lt 0 ]]; then
	echo "El numero es negativo"
else
	echo "El numero introducido es zero"
fi
