#!/bin/bash
DID=$(docker run --privileged=false --cap-drop all --cap-add SYS_CHROOT --cap-add SETGID --cap-add SETUID --cap-add CHOWN  -dt honey)
DPID=$(docker inspect ${DID} --format='{{ .State.Pid}}')
DIP=$(docker inspect ${DID} --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}')
echo "${DID} ${DIP}" >> /tmp/track
#( strace -p ${DPID} -ffffff -s 10000 -o /tmp/strace-${DPID} &)
exec /usr/bin/socat stdin tcp:${DIP}:2222,retry=60
