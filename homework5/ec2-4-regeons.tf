terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_key_pair" "ansible" {
  key_name   = "ansible-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
#terraform inport aws_key_pair.ansible ansible-key

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web-ubuntu-ohio" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_ins.instance_type[0]
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  region                 = var.region[0]
  count                  = var.count[0]
  tags = {
    Name = var.ec2_ins[0].name
  }
}

output ec2-ubuntu-ohio {
    value = aws_instance.web-ubuntu-ohio[*].public_ip
}

resource "aws_instance" "web-ubuntu-oregon" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_ins.instance_type[1]
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  region                 = var.region[1]
  count                  = var.count[1]
  tags = {
    Name = var.ec2_ins[1].name
  }
}

output ec2-ubuntu-oregon {
    value = aws_instance.web-ubuntu-oregon[*].public_ip
}


resource "aws_instance" "web-ubuntu-california" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_ins.instance_type[2]
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  region                 = var.region[2]
  count                  = var.count[2]

  tags = {
    Name = var.ec2_ins[2].name
  }
}

output ec2-ubuntu-california {
    value = aws_instance.web-ubuntu-california[*].public_ip
}

resource "aws_instance" "web-ubuntu-virginia" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_ins.instance_type[3]
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  region                 = var.region[3]
  count                  = var.count[3]
  tags = {
    Name = var.ec2_ins[3].name
  }
}

output ec2-ubuntu-virginia {
    value = aws_instance.web-ubuntu-virginia[*].public_ip
}