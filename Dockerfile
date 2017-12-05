FROM alpine:latest 
LABEL description="honey"
RUN apk update && apk add openssh-server && ssh-keygen -A && adduser -D admin && echo "admin:password" | chpasswd && echo "Port 2222" >> /etc/ssh/sshd_config
ENTRYPOINT /usr/sbin/sshd -D -f /etc/ssh/sshd_config

