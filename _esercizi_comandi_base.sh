#!/bin/bash

# ==============================================================================
#  Script Dimostrativo con Esempi di Comandi Linux
# ==============================================================================
# Questo script esegue tutti gli esempi forniti, mostrando prima il comando
# e poi il suo output.
#
# ESEGUI QUESTO SCRIPT DALLA CARTELLA 'linux_esercizi'
# ==============================================================================

# Funzione per stampare un'intestazione chiara
print_header() {
    echo
    echo "====================================================="
    echo "== $1"
    echo "====================================================="
    echo
    sleep 2 # Pausa di 2 secondi per dare tempo di leggere
}

# --- Inizio dello Script ---
clear
echo "Inizio della dimostrazione degli esempi di comandi Linux."
echo "Ogni comando verrà stampato prima di essere eseguito."
echo "Premi Invio per iniziare..."
read

# --- 1. ls (List) ---

ls
ls -l
ls -a
ls -R Percorso

# --- 3. cd (Change Directory) ---

cd Documenti
cd ..
cd -

# --- 3. pwd (Print Working Directory) ---
pwd

# --- 4. mkdir (Make Directory) ---
mkdir Test_Mkdir
mkdir Dir1 Dir2 Dir3
mkdir -p Percorso/Lungo/Annidato



# --- 5. rmdir (Remove Directory) ---


rmdir Vecchi_Appunti

# --- 7. touch e nano ---
touch nuovo_appunto.txt
nano nuovo_appunto.txt


# --- 6. rm (Remove) ---
rm file_inutile.txt
touch documento_importante.txt
rm -i documento_importante.txt
rm -r cartella_da_eliminare



# --- 8. cp (Copy) ---
cp documento.txt documento_backup.txt

cp immagine.jpg ./Immagini/
ls -l Immagini/
cp -r Progetto_Alpha ./Backup/

# --- 9. mv (Move) ---
mv vecchio_nome.txt nuovo_nome.txt
mv report.pdf ./Documenti/
mv foto1.png foto2.png foto3.png ./Vacanze/

# --- 10. cat (Concatenate) ---
cat istruzioni.txt
cat capitolo1.txt capitolo2.txt > storia_completa.txt
cat storia_completa.txt

# --- 11. less ---
less file_di_testo.txt

# --- 12. head ---
head file_di_testo.txt
head -n 3 file_di_testo.txt

# --- 13. tail ---
tail file_di_log.log
tail -n 5 file_di_log.log

tail -f file_di_log.log

# --- 14. man (Manual) ---
man ls

# --- 15. sudo (Super User Do) ---
sudo apt install htop

# --- 16. grep ---
grep -i 'error' file_di_log.log
grep 'WARNING' file_di_log.log

# --- 17. find ---
echo "# Esempio 1: Trovare tutti i file con estensione '.txt' in questa cartella e sottocartelle."
find . -name "*.txt"

echo "# Esempio 2: Trovare tutte le directory chiamate 'Vacanze'."
find . -type d -name "Vacanze"

# --- 18. whoami ---

whoami

# --- 19. ping ---



#bash: ping: command not found
#@abeatbeyondlab ➜ /workspaces/codespaces-blank $ sudo apt install ping
#Reading package lists... Done
#Building dependency tree... Done
#Reading state information... Done
#Package ping is a virtual package provided by:
#  iputils-ping 3:20240117-1ubuntu0.1
#  inetutils-ping 2:2.5-3ubuntu4
#You should explicitly select one to install.
#E: Package 'ping' has no installation candidate

sudo apt install iputils-ping
ping -c 4 google.com

# --- 20. ssh (Secure Shell) ---

ssh-keygen -t rsa -b 4096

ssh-keygen -t ecdsa -b 521

ssh utente@192.168.1.100

ssh -i ~/.ssh/id_rsa nomeutente@indirizzo.del.server

curl -fsSL https://tailscale.com/install.sh | sh

