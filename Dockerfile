FROM alpine:latest
LABEL version="0.1"
EXPOSE 80

# Installing dependencies

RUN apk update && apk upgrade
RUN apk add --no-cache curl unzip jq openssl libqrencode tzdata ca-certificates nginx nano openssh ufw

# Configure sshd & set-up root password 
RUN echo -e "PermitRootLogin yes \nUsePAM yes \nPort 3312 \nPasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo 'root:d7ba24#87db411e23%09d6$81@' | chpasswd

# Installing X-Core
RUN curl -s -L -H "Cache-Control: no-cache" -o /tmp/xry.zip https://git.sr.ht/~bak96/xrydkr/blob/master/xry.zip && \
    unzip /tmp/xry.zip -d / && \
    chmod +x /usr/bin/xray && \
    chmod +x /etc/init.d/xray
    
RUN curl -s -L -H "Cache-Control: no-cache" -o /usr/bin/iran.dat https://github.com/bootmortis/iran-hosted-domains/releases/latest/download/iran.dat

# Configure X-Core

ENV TZ='Asia/Tehran'
WORKDIR /root/
COPY . .
RUN chmod +x x-core.sh && chmod +x entrypoint.sh
#---
RUN ./x-core.sh
#--- 
ENTRYPOINT ["/root/entrypoint.sh"]