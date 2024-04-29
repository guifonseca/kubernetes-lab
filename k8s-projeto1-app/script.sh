#!/bin/bash

echo "Criando as imagens............"

docker build -t guilhermesantos21/projeto-backend:1.0 backend/.
docker build -t guilhermesantos21/projeto-database:1.0 database/.

echo "Realizando push das imagens.........."

docker push guilhermesantos21/projeto-backend:1.0
docker push guilhermesantos21/projeto-database:1.0

echo "Criando serviços no cluster kubernetes........"

kubectl apply -f ./services.yaml

echo "Criando os deployments........"

kubectl apply -f ./deployment.yaml