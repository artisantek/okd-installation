apiVersion: v1
metadata:
  name: ${OKD_CLUSTER_NAME}
baseDomain: ${OKD_BASE_DOMAIN}
controlPlane:
  architecture: amd64
  hyperthreading: Enabled
  name: master
  platform:
    aws:
      defaultMachinePlatform:
        type: ${OKD_MASTER_INSTANCE_TYPE}
  replicas: ${OKD_MASTER_REPLICAS}
compute:
- architecture: amd64
  hyperthreading: Enabled
  name: worker
  platform:
    aws:
      defaultMachinePlatform:
        type: ${OKD_COMPUTE_INSTANCE_TYPE}
  replicas: ${OKD_COMPUTE_REPLICAS}
networking:
  networkType: OVNKubernetes
  clusterNetwork:
  - cidr: 10.128.0.0/14
    hostPrefix: 23
  machineNetwork:
  - cidr: 10.0.0.0/16
  serviceNetwork:
  - 172.30.0.0/16
platform:
  aws:
    region: ${AWS_REGION}
    defaultMachinePlatform:
      type: ${OKD_MASTER_INSTANCE_TYPE}
publish: External
pullSecret: '${OKD_PULL_SECRET}'
sshKey: '${SSH_PUBLIC_KEY}'