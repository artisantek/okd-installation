#!/bin/bash

current_dir=$(dirname "$(readlink -f "$0")")

workdir=${current_dir}/okd-workdir
if [ ! -e ${workdir} ]; then
    echo "ERROR: cannot destroy cluster without workdir"
    exit 2
fi

./openshift-install destroy cluster --dir ${workdir} --log-level debug