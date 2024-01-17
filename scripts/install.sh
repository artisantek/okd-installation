#!/bin/bash

current_dir=$(dirname "$(readlink -f "$0")")
root_dir="$HOME"

ssh_key_path=${root_dir}/.ssh
mkdir -p "${ssh_key_path}"

if [ ! -e "${ssh_key_path}/id_rsa" ]; then
    ssh-keygen -t rsa -b 4096 -C "admin@openshift" -f "${ssh_key_path}/id_rsa" -N ''
fi

# set up workdir
workdir=${current_dir}/okd-workdir
[ ! -d "$workdir" ] && mkdir -p "$workdir"

export SSH_PUBLIC_KEY="$(cat ${ssh_key_path}/id_rsa.pub)"

export OKD_PULL_SECRET="$(cat ${current_dir}/pull-secret.txt)"

cat ${current_dir}/install-config.yaml.tpl | envsubst 1> ${workdir}/install-config.yaml

curl -L -o openshift-install-linux.tar.gz ${OKD_CLUSTER_INSTALL_URL}
curl -L -o openshift-client-linux.tar.gz ${OKD_CLIENT_INSTALL_URL}

tar -xzf openshift-client-linux.tar.gz
tar -xzf openshift-install-linux.tar.gz

sudo mv oc /usr/local/bin/
./openshift-install create cluster --dir ${workdir} --log-level debug

export KUBECONFIG=${workdir}/auth/kubeconfig

rm -rf openshift-client-linux.tar.gz openshift-install-linux.tar.gz README.md kubectl
