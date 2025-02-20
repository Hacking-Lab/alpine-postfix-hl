FROM hackinglab/alpine-base-hl:3.2
LABEL maintainer="Ivan Buetler <ivan.buetler@hacking-lab.com>"

# Add the files
ADD root /

RUN apk add --no-cache --update \
        vim \
        cyrus-sasl cyrus-sasl-crammd5 cyrus-sasl-digestmd5 cyrus-sasl-login cyrus-sasl-ntlm postfix \
        openssl opendkim opendkim-utils syslog-ng ca-certificates tzdata musl musl-utils

# Expose the ports for nginx
EXPOSE 25
