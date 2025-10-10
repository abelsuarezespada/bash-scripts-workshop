#!/bin/bash

echo "Por favor nombra una variable global:"

read variable

echo "Has escogido $variable:"
echo "${!variable}"
#Valor de retorn
echo "Valor de retorn: $?"

echo

echo "Argumentos pasados por el script: $@"
echo "Valor de retorno: $?"

echo

echo "PID del Shell: $$"
echo "Valor de retorno: $?"
