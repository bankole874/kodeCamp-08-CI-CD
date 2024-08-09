variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}

variable "public_security_group_id" {
  description = "The ID of the public security group"
  type        = string
}

variable "ssh_key_name" {
  description = "The name of the SSH key pair"
  type        = string
}
