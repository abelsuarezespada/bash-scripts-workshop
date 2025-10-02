#!/bin/bash 

# Abel Suarez 25/09/2025
# Aquest script el que fa es el comptar les linies utils del fitxer passwd i dels errors
# i els transcriu en un altre fitxer errors.log i linies.log
echo "Començant el recompte de linies útils..."

cat /etc/passwd | grep -v '^$'2&> errors.log |wc -l > linies.log

date >> linies.log 

echo "Procés completat! Consulta linies.log i errors.log"
