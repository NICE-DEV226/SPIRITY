# Image de base stable avec Node.js
FROM node:lts-buster

# Préparation de l'environnement
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ffmpeg \
      imagemagick \
      webp && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Répertoire de travail
WORKDIR /usr/src/app

# Copie du fichier de dépendances
COPY package.json ./

# Installation des dépendances Node.js
RUN npm install && npm install -g qrcode-terminal pm2

# Copie du reste des fichiers
COPY . .

# Port exposé (modifie si ton app utilise un autre)
EXPOSE 5000

# Commande de lancement
CMD ["npm", "start"]
