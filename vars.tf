variable "aws-region" {
  description = "The AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "instance-ami" {
  description = "The AMI of the instance to be deployed"
  type        = string
  default     = "ami-03f4878755434977f"
}

variable "instance-name" {
  description = "The Name of the instance to be deployed"
  type        = string
  default     = "okd-installer"
}

variable "sg-name" {
  description = "The Name of the SG for the instance to be deployed"
  type        = string
  default     = "okd-installer-sg"
}

variable "instance-type" {
  description = "The Size of the instance to be deployed"
  type        = string
  default     = "t2.medium"
}

variable "instance-key" {
  description = "The name of the key pair to be used"
  type        = string
  default     = "key1"
}

variable "access-key" {
  description = "The ACCESS KEY of AWS that will be used for OKD Installation"
  type        = string
  default     = ""
}

variable "secret-key" {
  description = "The SECRET KEY of AWS that will be used for OKD Installation"
  type        = string
  default     = ""
}

variable "okd-cluster-name" {
  description = "The Name of OKD Cluster"
  type        = string
  default     = "okd-ipi"
}

variable "okd-base-domain" {
  description = "The Base Domain of OKD Cluster"
  type        = string
  default     = ""
}

variable "okd-cluster-install-url" {
  description = "The Installation URL of OKD Cluster"
  type        = string
  default     = "https://github.com/okd-project/okd/releases/download/4.14.0-0.okd-2024-01-06-084517/openshift-install-linux-4.14.0-0.okd-2024-01-06-084517.tar.gz"
}

variable "okd-client-install-url" {
  description = "The Installation URL of OKD Cluster"
  type        = string
  default     = "https://github.com/okd-project/okd/releases/download/4.14.0-0.okd-2024-01-06-084517/openshift-client-linux-4.14.0-0.okd-2024-01-06-084517.tar.gz"
}

variable "master-replicas" {
  description = "The Number of Master Instances for OKD"
  type        = string
  default     = "1"
}

variable "compute-replicas" {
  description = "The Number of Worker Instances for OKD"
  type        = string
  default     = "1"
}

variable "master-instance-type" {
  description = "The Instance type of Master for OKD"
  type        = string
  default     = "t3.xlarge"
}

variable "compute-instance-type" {
  description = "The Instance type of Worker for OKD"
  type        = string
  default     = "t3.xlarge"
}







