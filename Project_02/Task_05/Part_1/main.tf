# TODO: Designate a cloud provider, region, and credentials

provider "aws" {
  access_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  region = "us-west-2"
}

resource "aws_instance" "UdacityT2" {
  count = "4"
  ami = "ami-0a243dbef00e96192"
  instance_type = "t2.micro"
  tags = {
    name = "Udacity T2"
  }
}

resource "aws_instance" "UdacityM4" {
  count = "2"
  ami = "ami-0a243dbef00e96192"
  instance_type = "m4.large"
  tags = {
    name = "Udacity M4"
  }
}


# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2


# TODO: provision 2 m4.large EC2 instances named Udacity M4
