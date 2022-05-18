FROM jenkins/jnlp-slave:alpine

USER root

RUN apk --update --no-cache add \
    musl-dev \
    python3 \
    python3-dev \
    zip \
    curl


ENTRYPOINT [ "jenkins-slave" ]
