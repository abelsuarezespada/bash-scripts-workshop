#!/bin/bash

archivo="Act3_parole.txt"

if [ ! -f "$archivo" ]; then
    echo "Error: el archivo '$archivo' no existe."
    exit 1
fi

#1
tmp="${archivo}.tmp"
> "$tmp"

IFS=$'\n'

for linia in $(cat "$archivo"); do
    limpieza="${linia%%\#*}"
    echo "$limpieza" >> "$tmp"
done

mv "$tmp" "$archivo"
echo "Comentarios eliminados correctamente."

#2
read -p "Introduce la palabra/frase que quieres buscar: " busqueda
encontrado=0

for linia in $(cat "$archivo"); do
    case "$linia" in
        *"$busqueda"*) encontrado=1 ;;
    esac
done

if [ $encontrado -eq 1 ]; then
    echo "La palabra/frase existe dentro del archivo."
else
    echo "La palabra/frase NO existe dentro del archivo."
fi

#3
frase=""

for intento in 1 2 3 4 5 6 7 8 9 10; do
    read -p "Introduce una frase para añadirla al final (obligatorio): " frase
    if [ -n "$frase" ]; then
        break
    fi
done

echo "$frase" >> "$archivo"
echo "Frase añadida correctamente."

