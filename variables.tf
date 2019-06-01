variable "cidr_vpc" {
  description = "Bloco CIDR para o VPC"
  default     = "10.1.0.0/16"
}
variable "cidr_subnet" {
  description = "Bloco CIDR para a sub-rede"
  default     = "10.1.0.0/24"
}
variable "availability_zone" {
  description = "Zona de disponibilidade para criar sub-rede"
  default     = "us-east-1a"
}
variable "instance_ami_2k12r2" {
  description = "AMI para instância aws EC2"
  default     = "ami-063e6917fb03cd4dd"
}
variable "instance_ami_2k16" {
  description = "AMI para instância aws EC2"
  default     = "ami-06bee8e1000e44ca4"
}

variable "instance_type" {
  description = "Tipo para a instância aws EC2"
  default     = "t2.micro"
}
variable "environment_tag" {
  description = "Tag de ambiente"
  default     = "Production"
}
variable "key-pair" {
  description = "Chave para gerar as senhas instancias"
  default     = "/home/robson/terraform-key.pem"
}

