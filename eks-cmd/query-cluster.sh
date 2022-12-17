#!/bin/bash
#
set +x
kubectl get all -n eks-sample-app
kubectl -n eks-sample-app describe service eks-sample-linux-service
kubectl -n eks-sample-app describe pod eks-sample-'*"
