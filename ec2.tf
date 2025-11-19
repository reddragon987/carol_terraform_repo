resource "aws_instance" "example" {
  ami           = var.my-os-image
  instance_type = var.machine_size
  key_name = var.private_key_name
  #adding security group id to ec2
  vpc_security_group_ids = [aws_security_group.carol_sec-grps.id]
  tags = {
    Name = var.vm_name
  }
}
 