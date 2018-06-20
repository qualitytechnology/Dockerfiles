# aws-kubectl
AWS EKS authentication using heptio-authenticator-aws

### Env
These envs need to be set:
```sh
AWS_ACCESS_KEY_ID: <aws-session-token>
AWS_SECRET_ACCESS_KEY: <aws-session-token>
AWS_SESSION_TOKEN: <aws-session-token>
CLUSTER_NAME: <eks-cluster-name>
CLUSTER_REGION: <aws-region-of-eks-cluster>
```

e.g:
```sh
docker run \
  -e AWS_ACCESS_KEY_ID=aaaaaaaaa \
  -e AWS_SECRET_ACCESS_KEY=aaaaaaaaa \
  -e AWS_SESSION_TOKEN=aaaaaaaaa \
  -e CLUSTER_NAME=aaaaaaaaa \
  -e CLUSTER_REGION=aaaaaaaaa \
  tiborv/aws-kubectl \
  kubectl get nodes
```