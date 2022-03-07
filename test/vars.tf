variable "tags" {
  default = {
    name = "App1_Test"
  }
}

variable "vpc_config" {
  default = {
    vpc_id = "vpc-019277b882e78157d"
    public_subnets = [
      "subnet-0d3d2170aa5e3d8e8",
      "subnet-0c37c4a3749c58279"
    ]
  }
}

variable "bastion_sg_config" {
  default = {
    security_group_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "10.1.0.0/16",
        description = "SSH from private ip address network space"
      },
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "1.2.3.4/32",
        description = "SSH from public ip address"
      }
    ]
  }
}

variable "bastion_host_config" {
  default = {
    ami_id        = "ami-0c293f3f676ec4f90"
    ssh_key_name  = "ssh_keys_poc"
    instance_type = "t3.nano"
  }
}
