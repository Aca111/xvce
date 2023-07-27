FROM alpine:latest
LABEL version="0.1"

# Installing dependencies
COPY sshd_config /etc/ssh/
RUN apk update && apk upgrade
RUN apk add --no-cache curl unzip jq openssl libqrencode tzdata ca-certificates nginx nano openssh \
    && ssh-keygen -A 

# Configure sshd & set-up root password 
#RUN echo -e "PermitRootLogin yes \nPort 3312 \nPasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo 'root:a2487db411e2309d681@' | chpasswd

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
EXPOSE 2222
#----
ENTRYPOINT ["/root/entrypoint.sh"]