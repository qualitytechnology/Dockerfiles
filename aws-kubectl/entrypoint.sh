#!/bin/sh
set -e

aws configure set default.region ${CLUSTER_REGION}
aws eks update-kubeconfig --name ${CLUSTER_NAME}

exec "$@"