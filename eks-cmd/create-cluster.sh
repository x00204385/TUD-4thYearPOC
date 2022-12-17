#!/bin/bash
set +x
# eksctl create cluster \
# --name poc-cluster \
##  --region eu-west-1 \
# --nodegroup-name k8s-nodes \
# --node-type t3.medium \
# --nodes 3
eksctl create cluster -f simple-cluster.yaml
