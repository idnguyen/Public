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
RUN apk add --no-cache curl

RUN apk update && apk --no-cache add \
  g++ \
  make \
  libffi-dev \
  openssl-dev \
  zip

USER jenkins
RUN cd /home/jenkins
RUN touch .bashrc .bash_profile

RUN (curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash)
RUN source /home/jenkins/.bashrc && nvm install v12.20.2
RUN node --version
RUN npm install aws-sdk
RUN npm install uuid

RUN npm install -g @angular/cli
RUN npm install -g aws-cdk
RUN npm -g install typescript
RUN npm install -g gulp
RUN npm install gulp

RUN npm install @aws-cdk/cloud-assembly-schema
RUN npm install @aws-cdk/cx-api

RUN npm i @aws-cdk/core
RUN npm i source-map-support

RUN npm i @aws-cdk/aws-lambda
RUN npm i @aws-cdk/aws-iam
RUN npm i @aws-cdk/aws-apigateway
RUN npm i @aws-cdk/aws-ssm
RUN npm i @aws-cdk/aws-s3

RUN npm i @aws-cdk/aws-dynamodb
RUN npm i @aws-cdk/aws-sqs
RUN npm i @aws-cdk/aws-lambda-event-sources
RUN npm i @aws-cdk/aws-apigatewayv2
RUN npm i @types/chai
RUN npm i dateformat
RUN npm i @types/fs-extra
RUN npm i @types/minimist
RUN npm i @types/mkdirp
RUN npm i @types/node
RUN npm i @jest/core@25.5.4
RUN npm i xhr@2.0.1
RUN npm i ts-jest
RUN npm i core-js

RUN npm i ts-node
RUN npm i path
RUN npm i fs

RUN npm i -g typescript

 
ENTRYPOINT [ "jenkins-slave" ]
