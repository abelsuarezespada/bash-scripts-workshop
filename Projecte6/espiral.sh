#!/bin/bash

echo ""
echo "AVISO ESTAS ENTRANDO A LA ESPIRAL DE EMOCIONES"
url="https://www.youtube.com/watch?v=jaLDoWqIq2M&feature=youtu.be"

while true; do
	read -p "DESEAS CONTINUAR? (S/N):" opcion

	case "$opcion" in
		S|Si|s|SI|si)
			echo "DE ACUERDO QUE DIOS SE APIADE DE TU ALMA"
			xdg-open "$url" >/dev/null 2>&1
			break
			;;
		N|No|n|NO|no)
			echo "ENTIENDO NO ESTAS PREPARADO PARA ESTO"
			echo ""
			echo "APROVECHA Y ESCAPA COBARDE"
			break
			;;
		*)
			echo "HEY DIME SI O NO"
			echo ""
			;;
	esac
done

