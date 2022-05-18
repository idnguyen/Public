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
    && pip3 install --no-cache-dir --upgrade pip awscli==1.18.13 aws-sam-cli==0.43.0 \
    && apk del \
    && rm -rf /var/cache/apk/* /root/.cache/pip/*

RUN apk add --no-cache git \
    && apk add nodejs \
    && npm install -g @angular/cli \
    && npm install -g aws-cdk \
    && npm -g install typescript \
    && npm install -g gulp \
    && apk add --no-cache curl

ENTRYPOINT [ "jenkins-slave" ]
