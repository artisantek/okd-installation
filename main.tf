resource "aws_instance" "okd-instance" {
  vpc_security_group_ids = [aws_security_group.okd-SG.id]
  ami                    = var.instance-ami
  key_name               = var.instance-key
  instance_type          = var.instance-type
  tags = {
    Name = var.instance-name
  }

  user_data = templatefile("env.tpl", {
    aws_region              = var.aws-region
    access_key              = var.access-key
    secret_key              = var.secret-key
    okd_cluster_name        = var.okd-cluster-name
    okd_domain_name         = var.okd-base-domain
    okd_cluster_install_url = var.okd-cluster-install-url
    okd_client_install_url = var.okd-cluster-install-url
    master_replicas         = var.master-replicas
    compute_replicas        = var.compute-replicas
    master_instance_type    = var.master-instance-type
    compute_instance_type   = var.compute-instance-type
  })

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.public_ip
    private_key = file("./key1.pem")
  }

  provisioner "file" {
    source      = "./scripts"
    destination = "/home/ubuntu/"
  }

  provisioner "remote-exec" {
      inline = [ 
        "sh /home/ec2-user/scripts/install.sh"
      ]
  }

}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "okd-SG" {
  description = "Allow SSH connection to EC2 Instances"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description      = "Open SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.sg-name
  }
}