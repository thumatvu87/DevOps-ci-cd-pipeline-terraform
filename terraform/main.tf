
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "jenkins_ec2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "your-key"
  tags = {
    Name = "jenkins-ec2"
  }
}
