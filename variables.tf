variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region_id" {}
variable "ami_id" {}
variable "key_name" {}

variable "vpc_security_group_ids" {
  type = "list"
}
