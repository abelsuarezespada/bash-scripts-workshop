#!/bin/bash
echo
echo "Estos son los argumentos: $@"
echo
if [[ $# == 3 ]]; then
	echo "Los argumentos totales son iguales a 3"
else
	echo "Los argumentos no son iguales a 3"
fi
