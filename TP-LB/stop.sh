#!/bin/bash

# Arrêt des trois conteneurs
docker stop nginx1 nginx2 nginx-lb

# Suppression des conteneurs s'ils existent encore
docker rm -f nginx1 nginx2 nginx-lb 2>/dev/null || true

# Suppression du réseau Docker
docker network rm tplb

echo "Infrastructure Load Balancing arrêtée."
