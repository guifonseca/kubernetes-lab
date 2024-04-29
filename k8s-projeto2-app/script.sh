#!/bin/bash

echo "Criando as imagens............"

docker build -t guilhermesantos21/projeto2-app:1.3 app/.
docker build -t guilhermesantos21/projeto2-mysql:1.7 mysql/.

echo "Realizando push das imagens.........."

docker push guilhermesantos21/projeto2-app:1.3
docker push guilhermesantos21/projeto2-mysql:1.7

echo "Criando secrets no cluster kubernetes........"

kubectl apply -f ./secrets.yaml

echo "Criando serviços no cluster kubernetes........"

kubectl apply -f ./services.yaml

echo "Criando os deployments........"

kubectl apply -f ./app-deployment.yaml
kubectl apply -f ./mysql-deployment.yaml