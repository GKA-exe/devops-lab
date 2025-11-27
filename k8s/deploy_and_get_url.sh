#!/bin/bash
# Deploy Kubernetes resources and print service URL for minikube (NodePort)

# Apply deployment and service YAMLs
echo "Applying deployment.yaml..."
kubectl apply -f deployment.yaml

echo "Applying service.yaml..."
kubectl apply -f service.yaml

# Wait for pods to be ready
echo "Waiting for pods to be ready..."
kubectl wait --for=condition=ready pod -l app=simple-app --timeout=120s

# Get service URL from minikube
echo "Fetching service URL from minikube..."
minikube service simple-app-service --url