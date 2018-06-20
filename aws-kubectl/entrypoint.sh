#!/bin/sh
set -e

aws configure set default.region ${CLUSTER_REGION}
export CA_CERT=$(aws eks describe-cluster --name ${CLUSTER_NAME}  --query cluster.certificateAuthority.data)
export ENDPOINT_URL=$(aws eks describe-cluster --name ${CLUSTER_NAME}  --query cluster.endpoint)
cat /config | envsubst > /kube/config
export KUBECONFIG=/kube/config

exec "$@"