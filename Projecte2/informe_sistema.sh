#!/bin/bash
echo
echo "Nombre de usuario: $USER"
echo "Resultado de whoami: $(whoami)"
echo
echo "Directorio personal: $HOME"
echo "Directorio actual: $PWD"
echo
echo "Contenido del directorio $PWD:"
echo "$(ls)"
echo
echo "Cantidad de elementos en el directorio: $(ls | wc -l)"
echo
echo "PID del Shell:$$"
echo "Codigo de retorno de la ultima orden: $?"
