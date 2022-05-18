FROM jenkins/jnlp-slave:alpine

USER root

RUN apk --update --no-cache add \
    musl-dev \
    gcc \
    nodejs nodejs-npm \
    python3 \
    python3-dev \
    py3-pip \
    zip \
    curl


ENTRYPOINT [ "jenkins-slave" ]
