# 1 - Build app React
FROM node:23-alpine AS builder

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install --production
COPY . .
RUN npm run build

# 2 - Serveur Nginx pour déployer le Front
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html

# expose le port 80 du conteneur
EXPOSE 80
# L'option -g "daemon off;" force Nginx à s'exécuter en avant-plan, empêchant ainsi Docker de considérer le processus comme terminé et d'arrêter le conteneur
CMD [ "nginx", "-g", "daemon off;" ]