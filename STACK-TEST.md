# Schritt 3 – Voller Stack auf dem Docker-Host (App + eigene DB)

**Ziel:** App-Container spricht mit einem eigenen MariaDB-Container, der aus
einem Dump Ihrer Live-DB befüllt wird. Erfolgskriterium: `/login` liefert
**HTTP 200** (das beweist zugleich, dass die DB erreichbar ist – die Login-Seite
liest per SELECT aus der Datenbank).

**Noch nicht Ziel:** voller Browser-Login (braucht HTTPS → siehe `NPM.md`).
Ihre Produktiv-DB wird nur gelesen (Dump), nie verändert.

---

## 1. Dump auf dem ISMS-Server ziehen

```bash
sudo mariadb-dump --single-transaction --routines --triggers isms > isms_dump.sql
```
`--single-transaction` = konsistenter Snapshot ohne Locks, der Live-Betrieb
läuft ungestört weiter.

---

## 2. Ordner auf dem Docker-Host vorbereiten

```bash
mkdir -p ~/wolfisms-stack/db-init && cd ~/wolfisms-stack

# Stack-Dateien hierher kopieren:
#   docker-compose.yml   .envdefault
# Dump in db-init/ legen:
scp benutzer@isms-server:~/isms_dump.sql db-init/     # oder manuell kopieren
```

Ergebnis:
```
~/wolfisms-stack/
├── docker-compose.yml
├── .env
└── db-init/
    └── isms_dump.sql
```

---

## 3. .env anlegen

```bash
cp .envdefault .env
```
Dann in `.env` setzen:
- `PROXY_ALIAS` (Name, unter dem NPM die App erreicht – ohne diesen Wert
  bricht `docker compose up` sofort ab)
- `DB_PASSWORD` und `DB_ROOT_PASSWORD` (frei wählbar – der DB-Container legt den
  User selbst an; der Dump enthält keine Benutzer)
- `WEBPATH` (öffentliche URL der Instanz, wird für Mail-Links gebraucht)

`ISMS_SECRET_KEY` kann leer bleiben – die App erzeugt den Schlüssel selbst und
legt ihn im Volume `sessions` ab.

---

## 4. Starten

```bash
docker compose up -d
```

Beim ersten Start spielt MariaDB den Dump ein – das kann bei großer DB ein
paar Minuten dauern. Fortschritt beobachten:

```bash
docker compose logs -f db      # bis "ready for connections"
```

---

## 5. Testen

Der Stack veröffentlicht keinen Port auf dem Host – die App ist nur über das
Docker-Netz erreichbar. Der Test läuft deshalb im Container:

```bash
# HTTP-Status der Login-Seite (erwartet: 200)
docker compose exec app curl -s -o /dev/null -w "%{http_code}\n" http://127.0.0.1:8000/login
```

Dasselbe prüft der im Image hinterlegte Healthcheck automatisch:

```bash
docker compose ps      # app muss "Up (healthy)" sein
```

```bash
# App-Logs
docker compose logs app
```

- **200** → App läuft, DB-Verbindung steht, Template rendert. **Schritt 3 bestanden.**
- **500 / Fehler** → `docker compose logs app` zeigt die Ursache. Häufig:
  - DB-Zugriff (Passwort in `.env` ↔ Import) → Meldung hierher.
  - Zeichensatz/Umlaute im Dump → sehen wir uns dann an.

---

## 6. Aufräumen (optional)

```bash
docker compose down            # Container weg, Daten bleiben (Volume)
docker compose down -v         # ALLES weg inkl. DB-Volume (Dump wird neu eingespielt)
```

---

## Was Sie NICHT erwarten sollten

`http://DOCKER-HOST:8000` im Browser: Es gibt keinen veröffentlichten Port,
die Adresse antwortet nicht. Und selbst über NPM geht der Login erst durch,
wenn dort HTTPS aktiv ist – `SESSION_COOKIE_SECURE=True` verlangt es. Für
diesen Test zählt nur der 200er aus dem Container.

---

## Hinweis: Zeichensatz

Zeigt die App später Umlaute falsch an, liegt es am Zeichensatz des Dumps
(utf8mb4 vs. latin1). Das ist ein bekannter, lösbarer Punkt – melden Sie es,
falls es auftritt, dann ergänzen wir den passenden Charset beim Import.
