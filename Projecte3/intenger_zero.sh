#!/bin/bash

echo "Introduce un numero:"
read numero
echo
if [[ $numero -eq 0 ]]; then
	echo "El numero es zero"
else
	echo "El numero no és zero"
fi
