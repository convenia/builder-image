FROM docker:latest

COPY ./jsonenv /usr/local/bin/jsonenv

RUN apk update && apk add curl && \
    # curl -o /usr/bin/docker-credential-ecr-login https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.5.0/linux-amd64/docker-credential-ecr-login && \
    # chmod a+x /usr/bin/docker-credential-ecr-login && \
    # mkdir /root/.docker && \
    apk add --no-cache vault libcap git && \
    setcap cap_ipc_lock= /usr/sbin/vault && \
    apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir \
        awscli \
    && rm -rf /var/cache/apk/* && \
    chmod +x /usr/local/bin/jsonenv