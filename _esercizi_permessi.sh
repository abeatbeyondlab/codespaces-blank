#!/bin/bash


# --- 1. Gestione Utenti e Gruppi ---
adduser --disabled-password --gecos "" mario
adduser --disabled-password --gecos "" luigi
addgroup sviluppatori
id mario
id luigi
usermod -aG sviluppatori mario
usermod -aG sviluppatori luigi

# --- 2. Preparazione Ambiente Permessi ---
mkdir progetto_condiviso
touch progetto_condiviso/documento.txt
echo '#!/bin/bash' > progetto_condiviso/script.sh
echo 'echo "Script eseguito!"' >> progetto_condiviso/script.sh
ls -l progetto_condiviso

# --- 3. chown (Change Owner) ---

chown -R mario:sviluppatori progetto_condiviso
ls -l progetto_condiviso

chmod g+w progetto_condiviso/documento.txt
chmod o-r progetto_condiviso/documento.txt
chmod u+x progetto_condiviso/script.sh
ls -l progetto_condiviso

# --- 5. chmod (Change Mode) - Metodo Ottale ---
print_header "5. chmod - Metodo Ottale"
chmod 640 progetto_condiviso/documento.txt
echo "Impostati permessi a 640 (rw-r-----) per 'documento.txt'"
chmod 750 progetto_condiviso/script.sh
echo "Impostati permessi a 750 (rwxr-x---) per 'script.sh'"

ls -l progetto_condiviso


# --- 6. Pulizia Finale ---
print_header "6. Pulizia dell'Ambiente"
userdel mario
echo "Utente 'mario' eliminato."
userdel luigi
echo "Utente 'luigi' eliminato."
groupdel sviluppatori
echo "Gruppo 'sviluppatori' eliminato."
rm -rf progetto_condiviso
echo "Directory 'progetto_condiviso' eliminata."

