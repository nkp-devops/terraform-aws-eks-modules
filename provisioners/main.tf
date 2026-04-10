module "create_ec2" {
    source = "./modules/create_ec2"
    ami_id = "ami-00bb6a80f01f03502"
    instance_type = "t2.micro"
    key_name = "feb-2025"
}

module "copy_install" {
   source = "./modules/file"
   connection_user = "ubuntu"
    ec2_public_ip = module.create_ec2.public_ip 
    pem_file = "./keys/feb-2025.pem"
    source_path = "./conf/install.sh"
    destination_path = "/home/ubuntu/install.sh"
}

module "run_remote_commands" {
    source = "./modules/remote-exec"
    connection_user = "ubuntu"
    ec2_public_ip = module.create_ec2.public_ip 
    pem_file = "./keys/feb-2025.pem"
    commands = ["chmod +x /home/ubuntu/install.sh",
                "sudo bash /home/ubuntu/install.sh" ]
    depends_on = [ module.copy_install ]
}

module "local_exec" {
    source = "./modules/local-exec"
    ec2_public_ip = module.create_ec2.public_ip
}