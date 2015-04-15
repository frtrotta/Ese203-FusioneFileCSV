#!/bin/bash

# In questo script l'elenco delle cartelle non è noto a priori.
# Qualsiasi directory contenuta nella directory corrente è considerata
# riferirsi ad una filiale

prima_filiale=1

for filiale in `ls -d */`
#for filiale in */
# La sintassi precedente e' anche valida.
do
	filiale=${filiale:0:${#filiale}-1}
	# Nell'istruzione precedente abbiamo eliminato l'ultimo carattere della stringa filiale
	# Esso corrisponde al carattere /, avendo selezionato le directory
	
	prima_riga=1
	while read -r linea
	do
		if [ $prima_riga -eq 1 ]
		then
			prima_riga=0
			if [ $prima_filiale -eq 1 ]
			then
				# Aggiungo l'intestazione per il nuovo campo come ultima colonna
				echo "${linea};filiale" > merged.csv
				prima_filiale=0
			fi
		else
			# Riporto la linea, aggiungendo il codice della filiale
			echo "${linea};$filiale" >> merged.csv
		fi		
	done < $filiale/export.csv
done
