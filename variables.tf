variable "admin_password" {
  description = "Windows Administrator password to login as."
  default     = "admin@pass"
}

variable "cidr_vpc" {
  description = "Bloco CIDR para o VPC"
  default     = "10.1.0.0/16"
}
variable "cidr_subnet" {
  description = "Bloco CIDR para a sub-rede"
  default     = "10.1.0.0/24"
}
variable "availability_zone" {
  description = "zona de disponibilidade para criar sub-rede"
  default     = "us-east-1a"
}
variable "instance_ami" {
  description = "AMI para instância aws EC2 "
  default     = "ami-063e6917fb03cd4dd"
}
variable "instance_type" {
  description = "type para a instância aws EC2"
  default     = "t2.micro"
}
variable "environment_tag" {
  description = "tag de ambiente"
  default     = "Production"
}
