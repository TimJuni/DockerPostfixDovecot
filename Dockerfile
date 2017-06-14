FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y dovecot-common dovecot-imapd openssl

ADD dovecot /etc/dovecot

RUN groupadd -g 5000 vmail && \
    useradd -g vmail -u 5000 vmail -d /home/vmail -m && \
    chgrp vmail /etc/dovecot/dovecot.conf && \
    chmod g+r /etc/dovecot/dovecot.conf

ADD start.sh /start.sh  

# IMAP ports  
EXPOSE 143
EXPOSE 993

CMD sh start.sh
