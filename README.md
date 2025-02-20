# Introduction
run postfix with smtp authentication (sasldb) in a docker container.
with STARTLS and OpenDKIM support.

# STARTTLS
Repository contains sample key and crt for postfix. Create your own keys with:


```bash
cd root/etc/postfix/certs
openssl req -newkey rsa:4096 -nodes -sha512 -x509 -days 3650 -nodes -out postfix.crt -keyout postfix.key
```

# DKIM
Repository contains sample dkim with selector = `jupiter._domainkey`. Create your own keys with:

```bash
cd root/etc/opendkim/domainkeys/
opendkim-genkey -s jupiter -d hacking-lab.com
```

# SMTP AUTH
Configure SMTP Users in your `docker-compose.yml`. The accounts will be created in the SASLDB. 

```bash
    environment:
      TZ: Europe/Zurich
      # Uncomment to enable debugging messages:
      #LOGXI: '*'
      maildomain: hacking-lab.com
      smtp_user: peter:abaeiierffwai,mike.gohan@example.com:asfaisofi
```

# MAILDOMAIN
Use the ENV in the `docker-compose.yml` 


# TEST MAIL Port 25
STARTLS is not supported on port 25
```bash
./smtptest.py -v -n 25 -t -u peter -p abaeiierffwai <sender-mail> <recipient-mail> <hostname> 
./smtptest.py -v -n 25 -t -u mike.gohan@example.com -p asfaisofi <sender-mail> <recipient-mail> <hostname> 
```

# TEST MAIL Port 587
STARTLS is supported on port 587
```bash
./smtptest.py -v -n 587 -t -u peter -p abaeiierffwai <sender-mail> <recipient-mail> <hostname> 
./smtptest.py -v -n 587 -t -u mike.gohan@example.com -p asfaisofi <sender-mail> <recipient-mail> <hostname> 
```
