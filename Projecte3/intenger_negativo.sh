#!/bin/bash
echo
echo "Introduce un numero:"
read numero
echo
if [[ $numero -ge 0 ]]; then
	echo "El numero no es negativo"
else
	echo "El numero es negativo"
fi
