Auf dem Docker-Host einmalig:

docker network create proxy

Verreichnis npm anlegen und darin docker-compose.yml anlegen:

services:
  npm:
    image: jc21/nginx-proxy-manager:2
    restart: unless-stopped
    ports:
      - "80:80"     # HTTP + ACME-Challenge
      - "443:443"   # HTTPS
      - "81:81"     # Admin-Oberflaeche
    volumes:
      - npm_data:/data
      - npm_letsencrypt:/etc/letsencrypt
    networks:
      - proxy

networks:
  proxy:
    external: true
    name: proxy

volumes:
  npm_data:
  npm_letsencrypt:

docker compose up -d



http://<server>:81

5. Proxy Host in NPM
Hosts → Proxy Hosts → Add Proxy Host:

Feld	Wert
Domain Names	isms.deine-domain.tld
Scheme	http
Forward Hostname	wolfisms-app (dein PROXY_ALIAS)
Forward Port	80
Block Common Exploits	an
Websockets Support	an

https ist Plicht, also Zertifikat für den Host anlegen.

Im Reiter SSL: „Request a new SSL Certificate", Force SSL und HTTP/2 an. Let's Encrypt braucht dafür, dass deine Domain öffentlich auf die Host-IP zeigt und Port 80 von außen erreichbar ist — sonst musst du auf eine DNS-Challenge ausweichen.
