#!/bin/bash

set -e

# Création du réseau Docker
docker network create tplb

# Construction de l'image du load balancer
docker build -t im-nginx-lb ./tp-A

# Création des dossiers partagés
mkdir -p shared1 shared2

# Création des pages HTML
echo "<h1>Hello 1</h1>" > shared1/index.html
echo "<h1>Hello 2</h1>" > shared2/index.html

# Démarrage du premier serveur
docker run -d \
  --name nginx1 \
  --network tplb \
  --rm \
  -p 81:80 \
  --mount type=bind,source="$(pwd)/shared1",target=/usr/share/nginx/html \
  nginx:latest

# Démarrage du deuxième serveur
docker run -d \
  --name nginx2 \
  --network tplb \
  --rm \
  -p 82:80 \
  --mount type=bind,source="$(pwd)/shared2",target=/usr/share/nginx/html \
  nginx:latest

# Démarrage du load balancer
docker run -d \
  --name nginx-lb \
  --network tplb \
  --rm \
  -p 83:80 \
  im-nginx-lb
