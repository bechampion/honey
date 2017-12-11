#!/bin/bash
DID=$(docker run --read-only --privileged=false --cap-drop all --cap-add SYS_CHROOT --cap-add SETGID --cap-add SETUID --cap-add CHOWN  -dt bechampion/honey)
DPID=$(docker inspect ${DID} --format='{{ .State.Pid}}')
DIP=$(docker inspect ${DID} --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}')
echo "${DID} ${DIP}" :: $(date) >> /tmp/track
#( strace -p ${DPID} -ffffff -s 10000 -o /tmp/strace-${DPID} &)
exec /usr/bin/socat stdin tcp:${DIP}:2222,retry=60
echo "done" >> /tmp/track
