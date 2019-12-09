#!/bin/sh

case "$1" in
    k8s)
        ansible-playbook -i hosts k8s.yml
        ;;
    node)
        ansible-playbook -i hosts node.yml
        ;;
    etcd)
        ansible-playbook -i hosts etcd.yml
        ;;
    flannel)
        ansible-playbook -i hosts flannel.yml
        ;;
    docker)
        ansible-playbook -i hosts docker.yml
        ;;
    *)
        echo "Usage:$0 k8s|node|etcd|flannel|docker"
        ;;
esac
