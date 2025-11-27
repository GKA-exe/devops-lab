#!/bin/bash

echo : "Kubectl"
kubectl apply -f manifests.yaml

echo : "get deployments"
kubectl get deployments

echo : "get pods"
kubectl get pods

echo : "get services"
kubectl get services

echo : "minikube service list"
minikube service list

echo : "run minikube service"
minikube service nginx-service --url