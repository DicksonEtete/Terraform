variable "key_name" {
  description = ""
  default = "key-pair"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "subnet_cidr" {
  default = "10.0.1.0/24"
}
variable "subnet1_cidr" {
  default = "10.0.2.0/24"
}
variable "region" {
  default = "us-east-1"
}