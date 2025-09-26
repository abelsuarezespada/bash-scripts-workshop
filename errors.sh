#!/bin/bash
cat /no_existo.txt 2> errors.log
echo "Alguna cosa ha fallat! Revisa errors.log"
