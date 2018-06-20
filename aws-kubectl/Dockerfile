FROM alpine:3.5
LABEL maintainer="Tibor Vukovic <vukovictibor@gmail.com>"

ENV KUBE_LATEST_VERSION="v1.10.4"

RUN apk add --update ca-certificates bash gnupg jq py-pip \
  && apk add --update -t deps curl gettext \
  && pip install awscli \
  && rm -rf /var/cache/apk/* 

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
  & curl -L https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/bin/linux/amd64/heptio-authenticator-aws -o /usr/local/bin/heptio-authenticator-aws \
  & wait \
  && chmod +x /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/heptio-authenticator-aws 

RUN mkdir -p kube
ADD . .
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
