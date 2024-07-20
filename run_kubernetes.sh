#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=tomlui2010/housepricepredictor

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment housepricepredictor-app --image=$dockerpath:latest
kubectl expose deployment housepricepredictor-app --type=NodePort --port=80 --target-port=5000
while [[ $(kubectl get pods -l app=housepricepredictor-app -o jsonpath="{.items[0].status.phase}") != "Running" ]]; do echo "Waiting for pod to be running..." && sleep 1; done


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward svc/housepricepredictor-deploy 8080:80

