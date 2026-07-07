# HTTPS ohne externen Reverse Proxy (eigene Zertifikate)

Der Stack kann auf zwei Arten per HTTPS laufen – umgeschaltet in der `.env`
über `COMPOSE_PROFILES`:

| `COMPOSE_PROFILES=` | Modus | HTTPS durch |
|---------------------|-------|-------------|
| *(leer)*            | Reverse-Proxy-Modus | externer Proxy (NPM) auf `APP_PORT` |
| `tls`               | Eigen-TLS-Modus | mitgelieferter Caddy auf 443 |

## Eigen-TLS aktivieren

1. In der `.env`:
   ```
   COMPOSE_PROFILES=tls
   APP_BIND=127.0.0.1          # App nicht mehr extern öffnen, nur Caddy
   TLS_DOMAIN=demo.wolfschus.net
   TLS_CERT_FILE=fullchain.pem
   TLS_KEY_FILE=privkey.pem
   WEBPATH=https://demo.wolfschus.net
   ```

2. Zertifikat + Schlüssel in `./certs/` ablegen (Namen wie oben):
   ```
   ./certs/fullchain.pem
   ./certs/privkey.pem
   ```
   - **Eigenes/CA-Zertifikat:** einfach hineinlegen.
   - **Selbstsigniert (intern):**
     ```
     mkdir -p certs
     openssl req -x509 -newkey rsa:2048 -nodes \
       -keyout certs/privkey.pem -out certs/fullchain.pem \
       -days 825 -subj "/CN=demo.wolfschus.net" \
       -addext "subjectAltName=DNS:demo.wolfschus.net"
     ```

3. Starten:
   ```
   docker compose up -d
   ```
   Durch `COMPOSE_PROFILES=tls` startet jetzt auch der Caddy-Dienst.

4. Prüfen:
   ```
   curl -k https://demo.wolfschus.net/login -o /dev/null -w "%{http_code}\n"
   ```
   Erwartet: 200. Der Login funktioniert, weil Caddy `X-Forwarded-Proto`
   setzt (das die App über ProxyFix auswertet).

## Zurück in den Reverse-Proxy-Modus (NPM)
```
COMPOSE_PROFILES=          # leer
APP_BIND=0.0.0.0
```
`docker compose up -d` — der Caddy-Dienst startet dann nicht.

## Mehrere Eigen-TLS-Instanzen auf einem Host
Jede Instanz braucht einen eigenen `TLS_HTTPS_PORT` (443 nur einmal möglich),
z. B. `TLS_HTTPS_PORT=8443` für die zweite. Für viele Instanzen ist der
NPM-Modus meist praktischer.

## Hinweis
Kein Let's Encrypt/ACME – Caddy nutzt ausschließlich die von Ihnen
bereitgestellten Dateien. Funktioniert daher auch rein intern/offline.
