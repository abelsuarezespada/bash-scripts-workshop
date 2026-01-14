#!/bin/bash

echo "Log Doctor - analitzador de logs"

if [ -n "$1" ]; then
    archivo="$1"
else
    read -p "Introduce el nombre del fichero de log: " archivo
fi

echo "Fichero de log seleccionado: $archivo"

while true; do
	if [ -z "$archivo" ]; then
		read -p "Porfavor, introduce un nombre de fichero valido: " archivo
	fi

	if [ ! -e "$archivo" ]; then
		echo "Error: '$archivo' no existe!"
		archivo=""
		continue
	fi

	if [ ! -f "$archivo" ]; then
		echo "Error: '$archivo' no es un fichero valido"
		archivo=""
		continue
	fi

	if [ ! -r "$archivo" ]; then
		echo "Error: '$archivo' no es legible"
		archivo=""
		continue
	fi

	echo "El fichero '$archivo' es valido y legible"
	break
done

lineas=$(wc -l < "$archivo")

error=$(grep -c "ERROR" "$archivo")

peligro=$(grep -c "WARNING" "$archivo")

echo ""
echo "Resultado del analisis"
echo ""

echo "Total de lineas: 	$lineas"
echo "Lineas con 'ERROR':     $error"
echo "Lineas con 'WARNING':   $peligro"

echo ""

while true; do
	read -p "Determina cuantos informes deseas generar (N): " num_info

	if [ -z "$num_info" ]; then
		echo "Error: Debes introducir un numero"
		continue
	fi

	if ! [[ "$num_info" =~ ^[0-9]+$ ]]; then
		echo "Error: '$num_info' no es un numero entero valido"
		continue
	fi

	if [ "$num_info" -le 0 ]; then
		echo "Error: El numero de informes tiene que ser mayor a 0"
		continue
	fi

	echo "Generando $num_info informes...."
	break
done

echo ""

mkdir -p "informes"

for (( i=1; i<=$num_info; i++ )); do
	nombre_info="informes/informe_$i.txt"

	cat > "$nombre_info" << INFORME_E0F


	INFORME DE ANALISIS DE LOG #$i


Fichero analisado: $archivo
Fecha de generacion: $(date '+%Y-%m-%d %H:%M:%S')


	RESULTADOS DEL ANALISIS


Lineas totales:		$lineas
Lineas con ERROR:	$error
Lineas con WARNING:	$warning


	FIN DEL INFORME #$i
INFORME_E0F

	echo "Informe $nombre_info generado correctamente"
done

echo "Informes generados en total: $num_info"
echo "Ubicacion de los informes: /informes"
