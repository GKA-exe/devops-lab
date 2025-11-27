#!/bin/bash

echo "Creating Kubernetes cluster using kind..."
kind create cluster --name my-cluster

echo "Applying Nginx Deployment and Service..."
kubectl apply -f nginx-deployment.yaml

echo "Deployment and Service created. Access it via:" 

kubectl get nodes -o wide 

kubectl get services 

echo "run chmod +x nginx-orchestration/run-nginx.sh and ./run-nginx.sh for results"