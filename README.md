# Ese203-FusioneFileCSV

Progettare uno o più shell script che permettano di integrare cinque file CSV, provenienti dalle diverse filiali, in un unico file CSV.

Ogni filiale è contraddistinta da un codice numerico su due cifre (01, 02, 03, 04, 05).

Il file CSV prodotto da ogni filiale ha nome `export.csv` e si trova nella sotto-directory col codice della filiale (vedi riquadro successivo).

Organizzazione dei file
```
<working_directory>
|
|-- merged.csv (da creare)
|
|--01
|  |-export.csv
|
|--02
|  |-export.csv
...
|--05
   |-export.csv

```

Tutti i file `export.csv` hanno la medesima organizzazione: la prima riga contiene i nomi dei campi, separati da punto e virgola; le righe successive contengono i dati, sempre separati da punto e virgola.

Il file CSV da creare si chiama `merged.csv`. Esso contiene tutti i dati degli `export.csv`, più un ulteriore campo, chiamato Filiale, che riporta il codice della filiale a cui il dato della riga si riferisce. 
