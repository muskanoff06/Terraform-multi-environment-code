
module "dev-app" {
  source = "./aws_infra"
  my-env = "dev"
  instance_type = "t2-micro"
  ami_id = "ami-123455"
  instance_Count = 1
}

module "stg-app" {
  source = "./aws_infra"
  my-env = "stg"
  instance_type = "t2-medium"
  ami_id = "ami-123455"
  instance_Count = 2
}

module "prod-app" {
  source = "./aws_infra"
  my-env = "prod"
  instance_type = "t2-large"
  ami_id = "ami-123455"
  instance_Count = 3
}
