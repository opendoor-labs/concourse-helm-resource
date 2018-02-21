FROM opendoor/helm as helm
FROM opendoor/kubectl as kubectl

FROM alpine:3.7

COPY --from=helm /bin/helm /usr/local/bin/helm
COPY --from=kubectl /usr/local/bin/kubectl /usr/local/bin/kubectl

RUN apk add --update --upgrade --no-cache jq bash nodejs yarn

RUN yarn global add typescript

ADD wait-for-helm-deployment /opt/wait-for-helm-deployment
RUN cd /opt/wait-for-helm-deployment && \
    yarn

ADD assets /opt/resource
RUN chmod +x /opt/resource/*

ENTRYPOINT [ "/bin/bash" ]
