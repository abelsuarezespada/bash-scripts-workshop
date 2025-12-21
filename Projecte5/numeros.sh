#!/bin/bash
positivos=0
negativos=0
ceros=0

for num in "$@"; do
    if [[ $num =~ ^-?[0-9]+$ ]]; then
        if [ "$num" -gt 0 ]; then
            ((positivos++))
        elif [ "$num" -lt 0 ]; then
            ((negativos++))
        else
            ((ceros++))
        fi
    else
        echo "Valor no valido: $num"
    fi
done

echo "Positivos: $positivos"
echo "Negativos: $negativos"
echo "Ceros: $ceros"

