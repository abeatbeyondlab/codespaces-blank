### Mini-Guida: Utenti e Permessi in Linux

#### 1. Gestione Utenti
I comandi per la gestione degli utenti richiedono privilegi di amministratore (`sudo`).

*   **`adduser [nome_utente]`**: Crea un nuovo utente in modo interattivo, creando anche la sua cartella home.
*   **`userdel [nome_utente]`**: Elimina un utente.
    *   `userdel -r [nome_utente]`: Elimina l'utente e anche la sua directory home.
*   **`usermod [opzioni] [nome_utente]`**: Modifica le proprietà di un utente.
    *   `-aG [gruppo]`: Aggiunge l'utente a un gruppo supplementare (fondamentale).
*   **`passwd [nome_utente]`**: Cambia la password di un utente.
*   **`id [nome_utente]`**: Mostra le informazioni su un utente (ID utente, ID gruppo, gruppi di appartenenza).

#### 2. Gestione Gruppi
Anche questi comandi richiedono `sudo`.

*   **`addgroup [nome_gruppo]`**: Crea un nuovo gruppo.
*   **`groupdel [nome_gruppo]`**: Elimina un gruppo.
*   **`getent group [nome_gruppo]`**: Mostra chi appartiene a un gruppo.

#### 3. Gestione Permessi
I permessi definiscono chi può fare cosa su un file o una directory. Si dividono in tre categorie: **Utente** (proprietario), **Gruppo** e **Altri**.

Ogni categoria può avere tre permessi base:
*   **`r`** (read - lettura): Visualizzare il contenuto.
*   **`w`** (write - scrittura): Modificare il contenuto.
*   **`x`** (execute - esecuzione): Eseguire un file (se è uno script/programma) o entrare in una directory.

**Comandi Chiave:**

*   **`chown [utente]:[gruppo] [file/dir]`** (Change Owner): Cambia il proprietario e/o il gruppo di un file o directory.
    *   `chown mario file.txt`: Cambia solo l'utente proprietario.
    *   `chown :sviluppatori file.txt`: Cambia solo il gruppo.
    *   `chown -R mario:sviluppatori ./progetto`: Applica i cambi ricorsivamente a tutta la directory.

*   **`chmod [permessi] [file/dir]`** (Change Mode): Modifica i permessi. Esistono due modi per definirli:

    *   **Metodo Simbolico (più intuitivo):**
        *   **Chi**: `u` (utente), `g` (gruppo), `o` (altri), `a` (tutti).
        *   **Azione**: `+` (aggiunge), `-` (rimuove), `=` (imposta esattamente).
        *   **Permesso**: `r`, `w`, `x`.
        *   *Esempi*: `chmod g+w file.txt` (aggiunge scrittura per il gruppo), `chmod u+x script.sh` (rende eseguibile per l'utente), `chmod o-r file.txt` (rimuove lettura per gli altri).

    *   **Metodo Ottale (più veloce):**
        *   Si usa un numero a 3 cifre (es. `755`). Ogni cifra rappresenta Utente, Gruppo e Altri.
        *   `4` = Read
        *   `2` = Write
        *   `1` = Execute
        *   I numeri si sommano: `7` (4+2+1 = rwx), `6` (4+2 = rw-), `5` (4+1 = r-x), `4` (4 = r--).
        *   *Esempi Comuni*: `chmod 755 script.sh` (rwx r-x r-x), `chmod 644 file.txt` (rw- r-- r--).

---




### Perché tre volte? Le Tre Categorie di Accesso

Ogni file e ogni directory in Linux non ha un solo set di permessi, ma **tre set distinti**, uno per ciascuna categoria di "persone" che possono accedervi:

1.  **Utente (User/Owner)**: Il proprietario del file. È la prima categoria e la più importante.
2.  **Gruppo (Group)**: Il gruppo a cui il file è associato. Chiunque sia membro di quel gruppo rientra in questa categoria.
3.  **Altri (Others)**: Chiunque altro. Tutti gli utenti del sistema che non sono né il proprietario né membri del gruppo.

Quando usi un numero a tre cifre come `640`, stai impostando i permessi per queste tre categorie **in quest'ordine preciso**:

```
chmod [Numero per l'Utente] [Numero per il Gruppo] [Numero per gli Altri] nome_file
```

Quindi, `chmod 640` significa:
*   Assegna i permessi "6" all'**Utente** proprietario.
*   Assegna i permessi "4" al **Gruppo**.
*   Assegna i permessi "0" a tutti gli **Altri**.

### Come si Calcolano i Numeri? La Logica della Somma

Ogni permesso (`r`, `w`, `x`) ha un valore numerico:

*   `r` (read) = **4**
*   `w` (write) = **2**
*   `x` (execute) = **1**

Per ottenere il numero che desideri per una categoria (Utente, Gruppo o Altri), **sommi i valori** dei permessi che vuoi concedere.

*   **Vuoi solo leggere?** → `r` → **4**
*   **Vuoi leggere e scrivere?** → `r` + `w` → 4 + 2 = **6**
*   **Vuoi leggere ed eseguire?** → `r` + `x` → 4 + 1 = **5**
*   **Vuoi tutti i permessi?** → `r` + `w` + `x` → 4 + 2 + 1 = **7**
*   **Non vuoi nessun permesso?** → **0**

### Analizziamo i Tuoi Esempi

Ora mettiamo tutto insieme e decifriamo i comandi e la dicitura `(rw-r-----)`.

#### 1. `chmod 640 progetto_condiviso/documento.txt` → `(rw-r-----)`

| Categoria | Numero | Calcolo       | Permessi | Risultato |
| :-------- | :----- | :------------ | :------- | :-------- |
| **Utente**  | **6**  | `4 (r) + 2 (w)` | `rw-`    | Il proprietario può **leggere e scrivere**. |
| **Gruppo**  | **4**  | `4 (r)`         | `r--`    | I membri del gruppo possono solo **leggere**. |
| **Altri**   | **0**  | `0`           | `---`    | Tutti gli altri **non possono fare nulla**. |

Quando `ls -l` mostra i permessi, li mette uno dopo l'altro nello stesso ordine: Utente, Gruppo, Altri. Ecco perché `640` si traduce visivamente in `rw-r-----`.

#### 2. `chmod 750 progetto_condiviso/script.sh` → `(rwxr-x---)`

| Categoria | Numero | Calcolo         | Permessi | Risultato |
| :-------- | :----- | :-------------- | :------- | :-------- |
| **Utente**  | **7**  | `4 (r)+2 (w)+1 (x)` | `rwx`    | Il proprietario può **leggere, scrivere ed eseguire**. |
| **Gruppo**  | **5**  | `4 (r) + 1 (x)`   | `r-x`    | I membri del gruppo possono **leggere ed eseguire** (ma non modificare lo script!). |
| **Altri**   | **0**  | `0`             | `---`    | Tutti gli altri **non possono fare nulla**. |

Quindi `750` si traduce in `rwxr-x---`. Questo è un set di permessi molto comune per gli script su un server condiviso: il proprietario ha il controllo totale, il gruppo può usarlo, ma nessun altro può vederlo o eseguirlo.

### Tabella Riassuntiva Veloce

| Numero | Permessi | Descrizione              |
| :----- | :------- | :----------------------- |
| **0**  | `---`    | Nessun permesso          |
| **1**  | `--x`    | Solo Esecuzione          |
| **2**  | `-w-`    | Solo Scrittura           |
| **3**  | `-wx`    | Scrittura ed Esecuzione  |
| **4**  | `r--`    | Solo Lettura             |
| **5**  | `r-x`    | Lettura ed Esecuzione    |
| **6**  | `rw-`    | Lettura e Scrittura      |
| **7**  | `rwx`    | Tutti i permessi         |

In sintesi, il metodo ottale è un modo veloce e compatto per impostare **tutti e tre i set di permessi** (per Utente, Gruppo e Altri) con un unico comando.



###  ATTENZIONE : Perché `777` è Pericoloso? La Porta di Casa Spalancata

Impostare i permessi di un file o di una directory a `777` è come lasciare la porta di casa non solo aperta, ma spalancata, con un cartello fuori che dice "Benvenuti, fate come se foste a casa vostra".

Analizziamo cosa significa `777`:
*   **Primo `7` (Utente):** `rwx` → Il proprietario può leggere, scrivere ed eseguire. (Questo è normale).
*   **Secondo `7` (Gruppo):** `rwx` → I membri del gruppo possono leggere, scrivere ed eseguire. (Questo è già rischioso).
*   **Terzo `7` (Altri):** `rwx` → **Chiunque** sul sistema può leggere, scrivere ed eseguire. (Questo è il disastro).

Il pericolo risiede in quel **terzo `7`**. Significa che qualsiasi utente, qualsiasi processo, anche quello con i privilegi più bassi, ha il controllo totale su quel file o quella directory.

Ecco i rischi concreti:

**Se `777` è su un file (es. `config.php`):**
1.  **Lettura (`r`):** Chiunque può leggere il contenuto. Se il file contiene password del database, chiavi API o altri dati sensibili, questi sono completamente esposti.
2.  **Scrittura (`w`):** Chiunque può modificare o cancellare il file. Un malintenzionato potrebbe:
    *   Cancellare tutto il contenuto, rendendo illeggibile la configurazione e rompendo il tuo sito/applicazione.
    *   Inserire codice malevolo che verrà eseguito dalla tua applicazione.
3.  **Esecuzione (`x`):** Se è uno script, chiunque può eseguirlo. Combinato con il permesso di scrittura, un aggressore può sostituire il tuo script con uno suo (es. uno script che cancella file o apre una backdoor) e poi eseguirlo.

**Se `777` è su una directory (es. `/var/www/html/uploads`):**
1.  **Lettura (`r`):** Chiunque può elencare i file al suo interno, scoprendo magari file che dovevano rimanere privati.
2.  **Scrittura (`w`):** Chiunque può **creare, rinominare e cancellare file** in quella directory. Questo è devastante. Un utente potrebbe caricare un file PHP malevolo (una "web shell") che gli darebbe il controllo completo del tuo server.
3.  **Esecuzione (`x`):** Chiunque può entrare (`cd`) in quella directory per interagire con i file al suo interno.

**La Regola d'Oro:** `chmod 777` è quasi sempre una scorciatoia usata per risolvere un problema di permessi senza capirne la causa. La soluzione corretta è quasi sempre usare `chown` per impostare il proprietario/gruppo corretto e poi usare permessi più restrittivi (come `755` per le directory e `644` per i file).

---

### Come Vedere i Permessi in Formato Ottale

Ci sono due modi principali per vedere i permessi, uno visuale (che richiede una conversione mentale) e uno diretto.

#### Metodo 1: Il Classico `ls -l` (e la conversione mentale)

Il comando `ls -l` mostra i permessi in formato simbolico (`drwxr-xr--`). Per convertirli in ottale, devi raggrupparli a tre a tre e fare la somma:

**Esempio 1: `drwxr-xr--`**
*   Il primo carattere `d` indica che è una directory.
*   Primo gruppo (Utente): `rwx` → 4 + 2 + 1 = **7**
*   Secondo gruppo (Gruppo): `r-x` → 4 + 0 + 1 = **5**
*   Terzo gruppo (Altri): `r--` → 4 + 0 + 0 = **4**
*   **Permesso Ottale: `754`**

**Esempio 2: `-rw-rw-r--`**
*   Il primo carattere `-` indica che è un file.
*   Primo gruppo (Utente): `rw-` → 4 + 2 + 0 = **6**
*   Secondo gruppo (Gruppo): `rw-` → 4 + 2 + 0 = **6**
*   Terzo gruppo (Altri): `r--` → 4 + 0 + 0 = **4**
*   **Permesso Ottale: `664`**

#### Metodo 2: Il Comando `stat` (il modo diretto)

Il comando `stat` (che sta per *status*) è uno strumento potentissimo che fornisce informazioni dettagliate su un file, inclusi i permessi in formato ottale, senza bisogno di calcoli.

La sintassi più utile per questo scopo è:
```bash
stat -c "%a %n" [nome_file_o_directory]
```
*   `-c "%a %n"`: È una stringa di formato che dice a `stat` cosa stampare.
    *   **`%a`**: Mostra i permessi di accesso in **ottale** (la "a" sta per *access*).
    *   **`%n`**: Mostra il **nome** del file.

**Esempio Pratico:**
Se hai un file `script.sh` e una directory `progetto/`:

```bash
$ ls -l
-rwxr-x--- 1 mario sviluppatori 45 Oct 25 10:30 script.sh
drwxr-xr-x 2 mario sviluppatori 4096 Oct 25 10:31 progetto/

$ stat -c "%a %n" script.sh progetto/
750 script.sh
755 progetto/
```

Come vedi, `stat` ti dà direttamente il numero ottale, rendendolo un modo rapido e a prova di errore per verificare i permessi. Puoi anche usarlo su tutti i file di una cartella con `*`:
```bash
stat -c "%a %n" *
```