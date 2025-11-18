resource "aws_instance" "example" {
  ami           = var.my-os-image
  instance_type = var.machine_size
  key_name = var.private_key_name
 
  tags = {
    Name = var.vm_name
  }
}
 