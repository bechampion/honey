#!/bin/bash
DIP=$(docker inspect $(docker run --privileged=false --cap-drop all --cap-add SYS_CHROOT --cap-add SETGID --cap-add SETUID --cap-add CHOWN  -dt honey) --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}')
exec /usr/bin/socat stdin tcp:${DIP}:2222,retry=60
