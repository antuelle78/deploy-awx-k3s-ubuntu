#!/bin/bash

cp /etc/rancher/k3s/k3s.yaml .
sed -i 's:localhost:hoseplak3s:;s:default:"{{ ansible_hostname }}":g' k3s.yaml
KUBECONFIG=./k3s.yaml kubectl config view --raw > config.tmp
mv config.tmp /root/.kube/config
