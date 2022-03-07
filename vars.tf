variable "tags" {}

variable "vpc_config" {
  type = object({
    vpc_id         = string
    public_subnets = list(string)
  })
}

variable "bastion_sg_config" {
  type = object({
    security_group_rules = list(object({
      from_port   = number,
      to_port     = number,
      protocol    = string,
      cidr_block  = string,
      description = string
    }))
  })
}

variable "bastion_host_config" {
  type = object({
    ami_id        = string
    ssh_key_name  = string
    instance_type = string
  })
}

locals {
  default_bastion_host_config = {
  }
  bastion_host_config = merge(
    local.default_bastion_host_config,
    var.bastion_host_config
  )
}
