
#To make EC2 Intsnace we require below resources
# KEY Pair (ssh-keygen then give file name and password)
# VPC
# Security group
# EC2

#Key Pair
resource "aws_key_pair" "mykey" {

    key_name = "aws_ec2_key"
    public_key = file ("D:/Muskan/Study/Terraform/Terraform-Practice/terraform-key.pub")
  
}
#Default VPC
resource "aws_default_vpc" "Default_VPC" {
  
}

#Security Group to do ssh and oepn port no 22 
resource "aws_security_group" "Security" {
  name = "allow ports"
  description = "Security grp to open port 22"
  vpc_id = aws_default_vpc.Default_VPC.id #Interpolation

#Incoming
  ingress {
        description = "This is for SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }

#Outgoing
  egress {
    description = "For outgoing traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#EC2 Instance
resource "aws_instance" "EC2" {
    ami = var.aws_ami   #ubuntu
    instance_type = var.aws_instance_type       #free tier 
    key_name  = "aws_key_pair.mykey.key_name"  #key
    security_groups = [ aws_security_group.Security.name ]  #SG

    tags = {
      name = "myEC2"  #Name
    }
}
