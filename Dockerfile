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

RUN apk add --no-cache git
RUN apk add nodejs
RUN npm install -g @angular/cli
RUN npm install -g aws-cdk
RUN npm -g install typescript
RUN npm install -g gulp
RUN npm install gulp
RUN apk add --no-cache curl

ENTRYPOINT [ "jenkins-slave" ]
