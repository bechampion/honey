FROM alpine:latest
LABEL description="honeypot"
RUN apk update && apk add openssh-server && ssh-keygen -A && adduser -D pepe && echo "pepe:qwe123" | chpasswd
ENTRYPOINT /usr/sbin/sshd -D -f /etc/ssh/sshd_config

