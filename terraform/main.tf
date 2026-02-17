provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "jenkins_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  tags = {
    Name = "jenkins-ec2"
  }
}