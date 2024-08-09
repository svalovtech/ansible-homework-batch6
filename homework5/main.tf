
# Download terraform:
#    type in your terminal <wget https://releases.hashicorp.com/terraform/1.9.4/terraform_1.9.4_linux_amd64.zip>
#    type (run) <ls>
# Copy from ls "terraform_1.9.4_linux_amd64.zip"
# Install unzip :
#    type <sudo apt install unzip>
#    type <unzip terraform_1.9.4_linux_amd64.zip>
#    run <ls>
# Check for execution permission   
#    run <ls -l> 
# If not 
#    type <chmod +x terraform>
# Move terraform in binary folder 
#    type <sudo mv terraform /usr/local/bin>
# Check if it's  in binary folder 
#     run <terraform version>
# Delete zip file 
#     type <sudo rm -rf terraform_1.9.4_linux_amd64.zip>
# Create IAM role and modify your AIM-role

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# resource "aws_key_pair" "ansible" {
#   key_name   = "ansible-key"
#   public_key = file("~/.ssh/id_rsa.pub")
# }

# terraform inport aws_key_pair.ansible ansible-key


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



resource "aws_instance" "web_ubuntu_virginia" {
  count                  = var.ec2_ins[0].count
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_ins[0].instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  availability_zone = "${var.region[0]}b"
  tags = {
    Name = var.ec2_ins[0].name
  }

  
}

output "ec2_ubuntu_virginia" {
  value = aws_instance.web_ubuntu_virginia[*].public_ip
}

resource "aws_instance" "web_ubuntu_ohio" {
  count                  = var.ec2_ins[1].count
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_ins[1].instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  availability_zone = "${var.region[1]}b"
  tags = {
    Name = var.ec2_ins[1].name
  }

  
}

output "ec2_ubuntu_ohio" {
  value = aws_instance.web_ubuntu_virginia[*].public_ip
}

resource "aws_instance" "web_ubuntu_california" {
  count                  = var.ec2_ins[2].count
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_ins[2].instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  availability_zone = "${var.region[2]}b"
  tags = {
    Name = var.ec2_ins[2].name
  }

  
}

output "ec2_ubuntu_california" {
  value = aws_instance.web_ubuntu_virginia[*].public_ip
}

resource "aws_instance" "web_ubuntu_oregon" {
  count                  = var.ec2_ins[3].count
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_ins[3].instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  availability_zone = "${var.region[3]}b"
  tags = {
    Name = var.ec2_ins[3].name
  }

  
}

output "ec2_ubuntu_oregon" {
  value = aws_instance.web_ubuntu_ohio[*].public_ip
}