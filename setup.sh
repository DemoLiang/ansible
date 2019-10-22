#!/bin/sh

case "$1" in
    k8s)
        ansible-playbook -i hosts k8s.yml
        ;;
    *)
        echo "Usage:$0 k8s"
        ;;
esac
