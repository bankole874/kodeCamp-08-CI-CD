resource "aws_instance" "Public_Instance" {
  ami                    = "ami-04a81a99f5ec58529"
  instance_type          = "t2.medium"
  subnet_id              = var.public_subnet_id
  security_groups        = [var.public_security_group_id]
  associate_public_ip_address = true
  key_name               = var.ssh_key_name

  user_data = file("${path.module}/../../scripts/install_minikube.sh")

  tags = {
    Name = "Public-Instance"
  }
}
