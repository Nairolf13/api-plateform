# Definition d'un argument pour la version de PHP
ARG PHP_VERSION=8.2
# Utiliser une image de base officielle de PHP avec Alpine Linux
FROM php:${PHP_VERSION}-alpine
# Definition d'un argument pour le nom du développeur
ARG DEVELOPED_BY=username
# Definition d'une variable d'environnement pour le port
# Definition d'une variable d'environnement pour le nom du développeur en utilisant l'argument DEVELOPED_BY
ENV DEVELOPED_BY=${DEVELOPED_BY:-username}
RUN  apk add --no-cache bash;\
curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash;\
apk add symfony-cli
# Définir le répertoire de travail dans le conteneur
WORKDIR /app
# Copier tous les fichiers de l'application dans le répertoire de travail
COPY . .
# Exposer le port 8080 pour accéder à l'application
EXPOSE 80
# Définir la commande par défaut pour lancer l'application
CMD php -S 0.0.0.0:80 -t /app/public