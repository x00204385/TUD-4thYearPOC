#!/bin/bash
#
kubectl create namespace eks-sample-app
kubectl apply -f eks-sample-app.yaml
kubectl apply -f eks-sample-service.yaml
