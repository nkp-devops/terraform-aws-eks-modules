module "create_pem" {
    source = "./modules/create_pem"
    key_name = "terraform-new"
    pem_file = "./terraform.pem"
}

module "create_ec2_root" {
    source = "./modules/create_ec2"
    ami_id = var.root_ami_id
    instance_type = "t2.micro"
    key_name = module.create_pem.key_name
}

module "create_s3" {
    source = "./modules/create_s3"
    bucket_name = "bucket-new-38264237965r0832-id-328ysaf"
}