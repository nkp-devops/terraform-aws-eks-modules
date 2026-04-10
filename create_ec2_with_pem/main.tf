resource "tls_private_key" "rsa" {
    algorithm = "RSA"
    rsa_bits = "4096"
}

resource "aws_key_pair" "new_pem" {
    key_name = var.key_name
    public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "pem_file" {
    filename = var.pem_file
    content = tls_private_key.rsa.private_key_pem
    file_permission = "0400"
}

resource "aws_instance" "test_ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.new_pem.key_name
    tags = {
      Name = "new_ec2"
    }
}