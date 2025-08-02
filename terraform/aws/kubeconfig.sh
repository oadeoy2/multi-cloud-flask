#!/bin/bash

CLUSTER_NAME=$(terraform output -raw cluster_name)

aws eks update-kubeconfig \
  --name "$CLUSTER_NAME" \
  --region us-east-1
