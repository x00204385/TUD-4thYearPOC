#!/bin/bash
set +x
eksctl delete cluster \
--name poc-cluster \
--region eu-west-1 
