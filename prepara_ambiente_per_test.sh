#!/bin/bash

# ==============================================================================
#  Script per la Preparazione dell'Ambiente per gli Esercizi Linux
# ==============================================================================
# Questo script crea una directory 'linux_esercizi' con tutti i file
# e le cartelle necessari per eseguire gli esempi dei 20 comandi base.
# ==============================================================================

# Messaggio di benvenuto
echo "====================================================="
echo "== Preparazione Ambiente per Esercizi Linux In Corso =="
echo "====================================================="
echo

# Crea una directory principale per non sporcare la cartella corrente
BASE_DIR="linux_esercizi"
echo "Creazione della directory di lavoro: $BASE_DIR/"

# Rimuove la directory se esiste già, per partire da un ambiente pulito
if [ -d "$BASE_DIR" ]; then
    rm -rf "$BASE_DIR"
    echo "Directory esistente '$BASE_DIR' rimossa per una nuova installazione."
fi

mkdir "$BASE_DIR"
cd "$BASE_DIR"

# --- Sezione 1: Creazione delle Directory ---
echo
echo "--- 1. Creazione delle directory necessarie... ---"
mkdir Documenti
mkdir Progetti
mkdir Musica
mkdir Video
mkdir Immagini
mkdir -p Scuola/Anno2025/MateriaInformatica
mkdir Vecchi_Appunti
mkdir -p Livello1/Livello2/Livello3
mkdir cartella_da_eliminare
mkdir Backup
mkdir Progetto_Alpha
mkdir Vacanze
echo "OK: Tutte le directory sono state create."

# --- Sezione 2: Creazione dei File Vuoti ---
echo
echo "--- 2. Creazione dei file vuoti di esempio... ---"
touch file_inutile.txt
touch documento_importante.txt
touch mio_file.txt
touch report.txt
touch note.md
touch script.sh
touch file_esistente.log
touch documento.txt
touch immagine.jpg
touch vecchio_nome.txt
touch report.pdf
touch foto1.png foto2.png foto3.png
touch file_di_configurazione.conf
echo "OK: Tutti i file vuoti sono stati creati."

# --- Sezione 3: Creazione dei File con Contenuto Specifico ---
echo
echo "--- 3. Inserimento di contenuto nei file di testo... ---"

# File per gli esempi di 'cat'
echo "Questa è la prima riga delle istruzioni." > istruzioni.txt
echo "Segui attentamente i passaggi per completare l'esercizio." >> istruzioni.txt

echo "Inizio del Capitolo 1." > capitolo1.txt
echo "C'era una volta in una terra lontana..." >> capitolo1.txt

echo "Inizio del Capitolo 2." > capitolo2.txt
echo "...e vissero tutti felici e contenti." >> capitolo2.txt

echo "Contenuto del file uno." > file1.txt
echo "Contenuto del file due." > file2.txt

# File per gli esempi di 'head', 'tail', e 'less' (con più di 10 righe)
echo "Riga 1" > file_di_testo.txt
for i in {2..20}; do
  echo "Riga $i del file di testo." >> file_di_testo.txt
done

# File di log per gli esempi di 'grep' e 'tail'
echo "INFO: Servizio [WebServer] avviato correttamente." > file_di_log.log
echo "DEBUG: Connessione al database 'users_db' stabilita." >> file_di_log.log
echo "WARNING: Lo spazio su disco nella partizione /dev/sda1 è in esaurimento (92% di utilizzo)." >> file_di_log.log
echo "INFO: Utente 'admin' ha effettuato l'accesso da 192.168.1.10." >> file_di_log.log
echo "ERROR: Impossibile trovare il file di configurazione /etc/app.conf. Utilizzo dei valori predefiniti." >> file_di_log.log
echo "INFO: Processo di backup notturno completato." >> file_di_log.log
echo "DEBUG: Valore della variabile 'cache_size' impostato a 2048." >> file_di_log.log
echo "FATAL: Errore critico del sistema. Il servizio si è arrestato in modo anomalo." >> file_di_log.log
echo "Warning: La libreria 'old_lib' è deprecata e verrà rimossa in una versione futura." >> file_di_log.log
echo "INFO: Backup dei dati utente completato con successo." >> file_di_log.log
echo "error: tentativo di connessione SSH fallito dall'IP 10.0.0.55" >> file_di_log.log

# File per popolare le directory da copiare e rimuovere
echo "Questo è un file temporaneo che verrà eliminato." > cartella_da_eliminare/file_temporaneo.tmp
echo "#!/bin/bash" > Progetto_Alpha/componente.sh
echo "echo 'Script del Progetto Alpha in esecuzione'" >> Progetto_Alpha/componente.sh
echo "README del progetto Alpha: questo progetto è un test." > Progetto_Alpha/README.md

echo "OK: Contenuto inserito correttamente."

# --- Messaggio Finale ---
cd ..
echo
echo "====================================================="
echo "==               AMBIENTE PRONTO!                  =="
echo "====================================================="
echo
echo "Tutti i file e le directory per gli esempi sono ora disponibili."
echo "Per iniziare gli esercizi, esegui questo comando:"
echo
echo -e "\033[1;32mcd $BASE_DIR\033[0m"
echo