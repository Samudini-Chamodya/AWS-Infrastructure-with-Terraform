variable "vpc_cidr" {
  type        = string
  description = "CIDR block of VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR block of Subnet"
  default     = "10.0.1.0/24"
}

variable "key_path" {
  type        = string
  description = "Path to your public key file"
  default     = "C:\\Users\\USER\\terraform-key.pub"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instance"
  default     = "ami-0de716d6197524dd9"
}
