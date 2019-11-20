FROM hyperized/scratch:latest as trigger
# Used to trigger Docker hubs auto build, which it wont do on the official images

FROM alpine:latest

LABEL maintainer="Gerben Geijteman <gerben@hyperized.net>"
LABEL description="AWS-CLI in Alpine"

RUN apk add --no-cache python3 \
 && pip3 install --no-cache-dir --upgrade pip \
 && rm -rf /var/cache/* \
 && rm -rf /root/.cache/* \
 && addgroup -S awscli && adduser -S awscli -G awscli

USER awscli

RUN pip3 install --no-warn-script-location awscli --upgrade --user

ENV PATH="/home/awscli/.local/bin/:${PATH}"
