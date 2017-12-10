FROM golang:alpine as builder
RUN apk update && apk add git && CGO_ENABLED=1 GOOS=linux go get -u github.com/jaksi/sshesame

FROM alpine
LABEL description="honey"
#RUN apk update && apk add openssh-server && ssh-keygen -A && adduser -D admin && echo "admin:password" | chpasswd && echo "Port 2222" >> /etc/ssh/sshd_config
COPY --from=builder /go/bin/sshesame /bin
ENTRYPOINT /bin/sshesame -port 2222 -listen_address 0.0.0.0

