#!/bin/bash

imagen="/home/abelsuarez/Baixades/31657707.jpg"

eleccion_maquina() {
    opcion=$(($RANDOM % 3))
    case $opcion in
        0) echo "piedra" ;;
        1) echo "papel" ;;
        2) echo "tijeras" ;;
    esac
}

ganador() {
    if [[ $1 == $2 ]]; then
        echo "Empate!"
    elif [[ $1 == "piedra" && $2 == "tijeras" ]] || \
         [[ $1 == "papel" && $2 == "piedra" ]] || \
         [[ $1 == "tijeras" && $2 == "papel" ]]; then
        echo "Tu ganas!"
    else
        echo "La maquina gana!"
        if [ -f "$imagen" ]; then
            xdg-open "$imagen"
        fi
    fi
}

while true; do
    echo "Escoje piedra, papel o tijeras:"
    read -p "Tu seleccion: " usuario

    if [[ "$usuario" != "piedra" && "$usuario" != "papel" && "$usuario" != "tijeras" ]]; then
        echo "Entrada no valida! Escoje entre piedra, papel o tijeras."
        continue
    fi

    maquina=$(eleccion_maquina)

    echo "La maquina ha escogido: $maquina"

    ganador "$usuario" "$maquina"

    read -p "Quieres volver a jugar una ronda mas? (si/no): " respuesta
    if [[ "$respuesta" == "no" && "$respuesta" == "no" ]]; then
        echo "Gracias por jugar!!!"
        break
    elif [[ "$respuesta" == "si"  ]]; then
	echo "De acuerdo vamos a por una mas!!!"
    else
	echo "Porfavor escoje entre si o no a la proxima, volvemos a jugar!!!"
    fi
done

