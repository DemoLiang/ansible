
node_name=`hostname -s|tr '[a-z]' '[A-Z]'`
node_ip=`ifconfig {{NET_INTERFACE_NAME}}|grep 'inet'|grep -v '127.0.0.1'|grep -v inet6|awk "{print $2}"`

etcd_data_dir=/etc/etcd/data/

mkdir -p $etcd_data_dir

cat <<EOF >/etc/etcd/etcd.conf
# 节点名称
ETCD_NAME=${node_name}
# 数据存放位置
ETCD_DATA_DIR=$etcd_data_dir
# 监听其他 Etcd 实例的地址
ETCD_LISTEN_PEER_URLS="http://$node_ip:{{ETCD_LISTEN_PORT_FOR_CLUSTER}}"
# 监听客户端地址
ETCD_LISTEN_CLIENT_URLS="http://$node_ip:{{ETCD_LISTEN_PORT_CLIENT}},http://127.0.0.1:{{ETCD_LISTEN_PORT_FOR_CLIENT}}"
# 通知 客户端地址
ETCD_ADVERTISE_CLIENT_URLS="http://$node_ip:{{ETCD_LISTEN_PORT_FOR_CLIENT}}"
# 通知其他 Etcd 实例地址
ETCD_INITIAL_ADVERTISE_PEER_URLS="http://$node_ip:{{ETCD_LISTEN_PORT_FOR_CLUSTER}}"
# 初始化集群内节点地址
ETCD_INITIAL_CLUSTER="{{ETCD_NODE1_NAME}}=http://{{ETCD_NODE1_IP}}:{{ETCD_LISTEN_PORT_FOR_CLUSTER}},{{ETCD_NODE2_NAME}}=http://{{ETCD_NODE2_IP}}:{{ETCD_LISTEN_PORT_FOR_CLUSTER}},{{ETCD_NODE3_NAME}}=http://{{ETCD_NODE3_IP}}:{{ETCD_LISTEN_PORT_FOR_CLUSTER}},"
# 初始化集群状态，new 表示新建
ETCD_INITIAL_CLUSTER_STATE="new"
# 初始化集群 token
ETCD_INITIAL_CLUSTER_TOKEN="demoliang-etcd-cluster"
EOF
