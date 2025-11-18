output "my-vm-public-ip" {

value = aws_instance.example.public_ip

}

resource "local_file" "carol-file" {
    content = aws_instance.example.public_ip
    filename = "${path.module}/myzip.txt"
}