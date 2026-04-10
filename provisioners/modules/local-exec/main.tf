resource "null_resource" "local_exec" {
    provisioner "local-exec" {
        command = "echo ${var.ec2_public_ip} > conf/inventory"
    }
}