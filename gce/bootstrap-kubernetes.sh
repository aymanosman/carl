#!/bin/bash
set -e

curl -O https://storage.googleapis.com/kubernetes-release/release/v1.2.0/bin/linux/amd64/kubectl
chmod +x kubectl
pods=$(./kubectl get pod -lapp=carl -o=jsonpath={.items..metadata.name})
# for p in pods; describe pod {.ip}
