#!/bin/bash
echo "export AWS_REGION=${aws_region}" >> /etc/profile.d/okd_env.sh
echo "export AWS_ACCESS_KEY_ID=${access_key}" >> /etc/profile.d/okd_env.sh
echo "export AWS_SECRET_ACCESS_KEY=${secret_key}" >> /etc/profile.d/okd_env.sh
echo "export OKD_CLUSTER_NAME=${okd_cluster_name}" >> /etc/profile.d/okd_env.sh
echo "export OKD_BASE_DOMAIN=${okd_domain_name}" >> /etc/profile.d/okd_env.sh
echo "export OKD_CLUSTER_INSTALL_URL='${okd_cluster_install_url}'" >> /etc/profile.d/okd_env.sh
echo "export OKD_CLIENT_INSTALL_URL='${okd_client_install_url}'" >> /etc/profile.d/okd_env.sh
echo "export OKD_MASTER_REPLICAS=${master_replicas}" >> /etc/profile.d/okd_env.sh
echo "export OKD_COMPUTE_REPLICAS=${compute_replicas}" >> /etc/profile.d/okd_env.sh
echo "export OKD_MASTER_INSTANCE_TYPE=${master_instance_type}" >> /etc/profile.d/okd_env.sh
echo "export OKD_COMPUTE_INSTANCE_TYPE=${compute_instance_type}" >> /etc/profile.d/okd_env.sh
