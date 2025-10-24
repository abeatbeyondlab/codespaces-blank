### Mini-Guida: Creare Script Bash

Uno script Bash non è altro che un file di testo contenente una serie di comandi che la shell (il terminale) esegue in sequenza, come se li avessi digitati uno per uno. È una "ricetta" per il tuo computer.

#### 1. I Tre Passaggi Fondamentali

Per creare ed eseguire uno script, segui sempre questi tre passaggi:

**Passaggio 1: Creare il File**
Crea un file di testo con l'estensione `.sh`. L'estensione non è obbligatoria per il sistema, ma è una convenzione fondamentale per far capire a te e agli altri che si tratta di uno script.

```bash
touch mio_script.sh```

**Passaggio 2: Scrivere lo Script (con lo Shebang!)**
Apri il file con un editor (es. `nano mio_script.sh`) e inizia a scrivere. La **primissima riga** deve essere sempre lo **Shebang**.

*   **Lo Shebang (`#!`)**: Questa riga speciale dice al sistema operativo *quale programma* usare per interpretare ed eseguire i comandi nel file. Per uno script Bash, è quasi sempre:
    ```bash
    #!/bin/bash
    ```

**Passaggio 3: Rendere lo Script Eseguibile**
Per motivi di sicurezza, i file di testo appena creati non hanno il permesso di esecuzione. Devi aggiungerlo tu con `chmod`.

```bash
chmod u+x mio_script.sh
```
*   `u+x`: Aggiunge (`+`) il permesso di esecuzione (`x`) solo per l'utente (`u`) proprietario.

Ora puoi eseguire lo script in questo modo:
```bash
./mio_script.sh
```
*   `./`: Indica al terminale di cercare il file nella directory corrente.

#### 2. Elementi di Base di uno Script

Ecco i mattoni fondamentali per costruire i tuoi script.

*   **Commenti**: Usa il cancelletto (`#`) per scrivere note. Tutto ciò che segue `#` su una riga viene ignorato.
    ```bash
    # Questo è un commento, serve a spiegare cosa fa lo script.
    ```
*   **Variabili**: "Scatole" per contenere dati. Si definiscono senza spazi attorno all'uguale (`=`) e si usano con il dollaro (`$`).
    ```bash
    NOME="Mario"
    echo "Ciao, $NOME!" # Stampa: Ciao, Mario!
    ```
*   **Input dell'Utente (`read`)**: Per chiedere informazioni all'utente e salvarle in una variabile.
    ```bash
    read -p "Come ti chiami? " NOME_UTENTE
    echo "Piacere di conoscerti, $NOME_UTENTE."
    ```
*   **Logica Condizionale (`if`, `else`, `fi`)**: Per eseguire comandi solo se una certa condizione è vera. **Attenzione:** gli spazi attorno alle parentesi quadre `[` `]` sono obbligatori!
    ```bash
    if [ "$NOME_UTENTE" == "Luigi" ]; then
      echo "Sei il mio omonimo!"
    else
      echo "Bel nome!"
    fi
    ```

---

### La Differenza tra `sh` e `bash`

Questa è una domanda cruciale. L'analogia migliore è pensare alle lingue:

*   **`sh` (Bourne Shell)**: È come l'**italiano standard**, quello definito dall'Accademia della Crusca. È la base, il linguaggio "ufficiale" definito dallo standard POSIX. È garantito che sia presente su quasi ogni sistema UNIX-like (Linux, macOS, BSD, ecc.). È semplice, universale e super portabile.

*   **`bash` (Bourne Again SHell)**: È come un **dialetto ricco e moderno**, ad esempio il milanese o il romano. Contiene **tutto l'italiano standard (`sh`)** e in più aggiunge un sacco di parole, espressioni e funzionalità extra che lo rendono più comodo e potente per l'uso di tutti i giorni.

**In pratica:**
*   `bash` è un **superset** di `sh`. **Tutti gli script `sh` validi funzionano in `bash`**, ma non tutti gli script `bash` funzionano in `sh` se usano le sue funzionalità extra (es. array, test condizionali avanzati con `[[...]]`, ecc.).
*   Sulla maggior parte delle distribuzioni Linux (Ubuntu, Fedora, etc.), `bash` è la shell predefinita. Quando apri un terminale, stai usando `bash`.

---

### Perché per runnare script `.sh` uso `bash`?

Ci sono due modi per eseguire uno script, ed entrambi rispondono alla tua domanda.

Consideriamo questo script salvato come `saluta.sh`:
```bash
#!/bin/bash
echo "Ciao dal mio script!"
```

**Metodo 1: Esecuzione Diretta (il metodo standard)**

```bash
chmod +x saluta.sh
./saluta.sh
```
*   **Cosa succede?** Qui stai dicendo al sistema operativo: "Esegui questo file". Il sistema operativo guarda la prima riga, vede lo shebang `#!/bin/bash`, e capisce che deve avviare l'interprete `/bin/bash` e dargli in pasto il resto dello script. In questo caso, **è lo shebang a decidere che viene usato `bash`**.

**Metodo 2: Esecuzione tramite Interprete (il tuo caso)**

```bash
bash saluta.sh
```
*   **Cosa succede?** Qui stai facendo una cosa diversa. Stai dicendo: "Avvia il programma `bash`, e digli di leggere ed eseguire i comandi che trova nel file `saluta.sh`".
*   In questo caso, **lo shebang (`#!/bin/bash`) viene completamente ignorato**. Stai forzando l'uso di `bash` esplicitamente.
*   Questo metodo funziona anche se lo script **non ha i permessi di esecuzione** (`chmod +x`), perché non stai eseguendo `saluta.sh` direttamente, ma lo stai solo usando come "lista di istruzioni" per il programma `bash` che hai già avviato.

**In sintesi:**
Usi `bash nome_script.sh` perché stai esplicitamente dicendo al sistema di usare l'interprete `bash` per quel file. È un modo diretto per eseguire uno script, che bypassa sia i permessi di esecuzione sia lo shebang, ed è molto utile quando uno script non è eseguibile o vuoi testarlo con un interprete specifico.