#!/bin/bash

contador=0

until [ $contador -eq 3 ]; do
    read -p "Introduce un valor numerico: " valor

    if [[ "$valor" =~ ^-?[0-9]+$ ]]; then
        valores[$contador]=$valor
        contador=$((contador + 1))
    else
        echo "Error: '$valor' no es un numero entero valido. Intentalo de nuevo."
    fi
done

suma=0
for valor in "${valores[@]}"; do
    suma=$((suma + valor))
done
echo "La suma de los tres valores es: $suma"

producto=1
for valor in "${valores[@]}"; do
    producto=$((producto * valor))
done
echo "El producto de los tres valores es: $producto"

grande=${valores[0]}
peque=${valores[0]}

for valor in "${valores[@]}"; do
    if [ $valor -gt $grande ]; then
        grande=$valor
    fi
    if [ $valor -lt $peque ]; then
        peque=$valor
    fi
done

echo "El valor mas grande es: $grande"
echo "El valor mas pequeño es: $peque"
