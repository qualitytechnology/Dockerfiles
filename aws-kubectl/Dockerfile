FROM alpine:3.5
LABEL maintainer="Tibor Vukovic <vukovictibor@gmail.com>"

ENV KUBE_VERSION="v1.11.3"

RUN apk add --update ca-certificates bash gnupg jq py-pip \
  && apk add --update -t deps curl \
  && pip install awscli \
  && rm -rf /var/cache/apk/* 

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
  & curl -L https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.3.0/heptio-authenticator-aws_0.3.0_linux_amd64 -o /usr/local/bin/aws-iam-authenticator \
  & wait \
  && chmod +x /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/aws-iam-authenticator

WORKDIR /kube 
ADD entrypoint.sh .
ENV KUBECONFIG=/kube/config
RUN touch /kube/config

RUN chmod +x entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
