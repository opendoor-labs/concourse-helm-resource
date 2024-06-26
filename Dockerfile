FROM linkyard/alpine-helm:2.16.7
LABEL maintainer "mario.siegenthaler@linkyard.ch"

RUN apk add --update --upgrade --no-cache jq bash curl git gettext libintl

ENV KUBERNETES_VERSION 1.16.9
RUN curl -L -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl; \
  chmod +x /usr/local/bin/kubectl


RUN mkdir -p "$(helm home)/plugins"
RUN helm plugin install https://github.com/databus23/helm-diff && \
  helm plugin install https://github.com/rimusz/helm-tiller

ADD assets /opt/resource
RUN chmod +x /opt/resource/*

ENTRYPOINT [ "/bin/bash" ]
