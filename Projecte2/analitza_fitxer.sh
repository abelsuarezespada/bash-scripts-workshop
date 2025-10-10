#!/bin/bash
echo "Analizant fitxer..."
echo "Determini el fitxer a analitzar:"
read fitxer
echo
echo "S'analitzara l'arxiu: $fitxer"
ls /$fitxer > resultats.log 2&> errors.log
echo "Completat! Consulti l'arxiu resultats.log i errors.log"
{
echo "================================"
echo "Fitxer Analitzat: $fitxer"
echo "Línies útils: $(grep -cv '^$' "$fitxer" 2>>errors.log)"
echo "Paraules totals: $(wc -w < "$fitxer" 2>>errors.log)"
echo "Totals caracters: $(wc -m < "$fitxer" 2>>errors.log)"
echo "Data: $(date)"
echo "Executat per: $USER"
echo "Directori situat: $PWD"
echo "PID de Shell: $$"
} > resultats.log
