variable "ssh_key_name" {
  description = "The name of the SSH key pair"
  type        = string
  default     = "id_rsa"
}

variable "ssh_key_path" {
  description = "Path to the SSH public key file"
  type        = string
  default     = "/root/.ssh/"
}
