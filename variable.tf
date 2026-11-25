
variable "my-env" {
   description = "This is the environment for infra"
   type = string
}

variable "ami_id" {
  description = "This is the ami if for EC2"
  type = string
}

variable "instance_type" {
  description = "This is type of instance  for EC2"
}

variable "instance_Count" {
  description = "This is count of EC2"
  type = number
}
