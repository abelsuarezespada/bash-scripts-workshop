#!/bin/bash

if [[ $# -ne 3 ]]; then
	echo "Porfavor introduzca una operacion valida"
	exit 1
fi

# Numeros
numero1="$1"
operacion="$2"
numero2="$3"

if ! [[ "$numero1" =~ ^-?[0-9]+$ ]]; then
	echo "Porfavor introduce un numero entero valido"
	exit 1

elif ! [[ "$numero2" =~ ^-?[0-9]+$ ]]; then
        echo "Porfavor introduce un numero entero valido"
        exit 1
fi

#Operaciones

if [[ "$operacion" == "+" ]]; then
	echo "El resultado es: $((numero1 + numero2))"
elif [[ "$operacion" == "-" ]]; then
	echo "El resultado es: $((numero1 - numero2))"
elif [[ "$operacion" == "·" ]]; then
        echo "El resultado es: $((numero1 * numero2))"
elif [[ "$operacion" == "/" ]]; then
        echo "El resultado es: $((numero1 / numero2))"
else
	echo "No se pudo determinar la clase de operacion, porfavor introduzca un signo valido (+, -, ·, /)"
fi

