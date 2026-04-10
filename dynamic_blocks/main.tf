provider "aws" {
   region = "ap-south-1"
}

resource "aws_security_group" "name" {
    name = "my-sg"
    dynamic "ingress" {
        for_each = var.inbound_rules
        content {
          from_port = ingress.value["from_port"]
          to_port = ingress.value["to_port"]
          protocol = ingress.value["protocol"]
          cidr_blocks = ingress.value["cidr_blocks"]
        }
    }
}