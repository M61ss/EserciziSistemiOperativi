#!/usr/bin/sh


### LEGENDA RETURN VALUES ###

# 0: Tutto e' andato a buon fine
# 1: Numero parametri errato
# 2: Il parametro non e' un path assoluto
# 3: Il parametro non e' una directory
# 4: Il parametro non e' una directory traversabile
# 5: Il parametro non e' un numero intero
# 6: Il numero non e' positivo

# -------------------------------------------------------------------------------------------------------------- #

### Aggiornamento del PATH ###

# Aggiungo alla variabile d'ambiente PATH il path corrente
PATH=`pwd`:$PATH
# Aggiungo le modifiche effettuate alla variabile d'ambiente esportandola
export PATH

# -------------------------------------------------------------------------------------------------------------- #

### Controllo PARAMETRI STRETTO ###

# Controllo che il numero di parametri sia esattamente quello desiderato
if test $# -ne )
then
    # In tal caso il numero dei parametri e' diverso da quello richiesto, quindi interrompo l'esecuzione
    echo "Numero parametri errato. Processo interrotto."
    # Esco specificando un valore intero di errore
    exit 1;
fi

# -------------------------------------------------------------------------------------------------------------- #

### Controllo PARAMETRI LASCO ###

# Controllo che il numero di parametri sia rientri nella soglia desiderata
if test $# -lt )
then
    # In tal caso il numero dei parametri non riesntra nell'intervallo desiderato, quindi interrompo l'esecuzione
    echo "Numero parametri errato. Processo interrotto."
    # Esco specificando un valore intero di errore
    exit 1;
fi

# -------------------------------------------------------------------------------------------------------------- #

### Verifico che il PATH sia ASSOLUTO ###
### Verifico che se la DIRECTORY e' ESISTENTE ###
### Verifico che se la DIRECTORY e' TRAVERSABILE ###

case $i in
/*)
    echo "Il parametro $i e' un path assoluto."
    # Verifico l'esistenza della directory
    if test -d $i
    then
        echo "Il parametro $i e' una directory."
        # Verifico che la directory sia traversabile
        if test -x $i
        then
            echo "Il parametro $i e' una directory traversabile."
        else
            echo "Il parametro $i non e' una directory traversabile. Processo interrotto."
            # Esco specificando un valore intero di errore
            exit 4
        fi
    else
        echo "Il parametro $i non e' una directory. Processo interrotto."
        # Esco specificando un valore intero di errore
        exit 3
    fi;;
*)
    echo "Il parametro $i non e' un path assoluto. Processo interrotto."
    # Esco specificando un valore intero di errore
    exit 2;;
esac

# -------------------------------------------------------------------------------------------------------------- #

### Ciclo con CONTATORE ###

# Dichiaro una variabile da usare come contatore
J=1
# Scorro la lista in un ciclo che utilizza il contatore J
for i
do
    # Incremento la variabile contatore di 1 a ogni iterazione
    J=`expr $J + 1`
done
# Reimposto il contatore al punto di partenza, ovvero a 1
J=1

# -------------------------------------------------------------------------------------------------------------- #

### Creazione LISTA ###

# Creo una variabile che utilizzero' come contenitore per la mia lista
var=
# Uso un ciclo per riempire la lista
for i
do
    # Inserisco il nuovo elemento in coda alla lista
    var="$var $i"
done

# -------------------------------------------------------------------------------------------------------------- #

### Controllo se il PARAMETRO e' un NUMERO INTERO ###
### Controllo se il PARAMETRO e' un NUMERO POSITIVO ###

# Controllo se il parametro e' un numero intero
case $i in
*[!0-9]*)
    # In tal caso il parametro non e' un numero intero, quindi interrompo l'esecuzione
    echo "Il parametro $i non e' un numero intero. Processo interrotto."
    # Esco specificando un valore intero di errore
    exit 5;;
*)
    echo "Il parametro $i e' un numero intero."
    # Controllo se il numero e' positivo
    if test `expr $i` -le 0
    then
        echo "Il numero $i non e' positivo."
        # Esco specificando un valore intero di errore
        exit 6
    else
        echo "Il numero $i e' positivo."
    fi;;
esac

# -------------------------------------------------------------------------------------------------------------- #