
node_name=`hostname -s|tr '[a-z]' '[A-Z]'`
node_ip=`ifconfig {{NET_INTERFACE_NAME}}|grep 'inet'|grep -v '127.0.0.1'|grep -v inet6|awk "{print $2}"`
