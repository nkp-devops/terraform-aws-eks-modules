provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}

# Uses default provider us-east-1
resource "aws_instance" "east_instance" {
  ami      = "ami-12345678"
  instance_type = "t2.micro"
}

# Uses alias provider mumbai ap-south-1
resource "aws_instance" "mumbai_instance" {
  provider = aws.mumbai
  ami      = "ami-87654321"
  instance_type = "t2.micro"
}