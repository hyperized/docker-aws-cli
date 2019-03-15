FROM alpine:latest

LABEL maintainer="Gerben Geijteman <gerben@hyperized.net>"
LABEL description="AWS-CLI in Alpine"

RUN apk add --no-cache python3 \
 && pip3 install --no-cache-dir --upgrade pip \
 && rm -rf /var/cache/* \
 && rm -rf /root/.cache/* \
 && addgroup -S awscli && adduser -S awscli -G awscli

USER awscli

RUN pip3 install awscli --upgrade --user

ENTRYPOINT ["./home/awscli/.local/bin/aws"]
CMD ["--version"]
