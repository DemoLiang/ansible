# ansible

ansible for setup project


## setup roles/k8s

roles k8s 主要是想做成自动部署k8s集群的

环境：

节点|hostname|ip
-|-|-
master|node1|
work|node2|
work|node3|

#mac 安装sshpass
由于mac上使用带密码的形式跑ansilbe会报错,需要安装sshpass,mac上安装方式如下
linux 应该可以直接yum install -y sshpass就可以
export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
