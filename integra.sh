#!/bin/bash

# In questo script l'elenco delle cartelle da trattare è definito con seq
# Il comando read utilizza l'opzione -r

for filiale in `seq 5` 
do
	filiale=0$filiale
	prima_riga=1
	while read -r linea
	do
		if [ $prima_riga -eq 1 ]
		then
			prima_riga=0
			if [ "$filiale" == '01' ]
			then
				# Aggiungo l'intestazione per il nuovo campo come ultima colonna
				echo "${linea};filiale" > merged.csv
			fi
		else
			# Riporto la linea, aggiungendo il codice della filiale
			echo "${linea};$filiale" >> merged.csv
		fi		
	done < $filiale/export.csv
done
