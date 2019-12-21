#/bin/sh

etcdctl set /atomic.io/network/config '{"Network":"172.10.0.0/16" }'
iptables -P FORWARD ACCEPT
