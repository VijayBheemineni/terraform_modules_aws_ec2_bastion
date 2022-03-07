resource "aws_security_group" "bastion_sg" {
  name        = join("_", [var.tags.name, "bastion_host"])
  description = join(" ", [var.tags.name, "security group used by bastion"])
  vpc_id      = var.vpc_config.vpc_id

  dynamic "ingress" {
    for_each = var.bastion_sg_config.security_group_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = [ingress.value.cidr_block]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = join("_", [var.tags.name, "bastion_host"])
    }
  )
  lifecycle {
    create_before_destroy = true
  }
}

resource "random_shuffle" "az" {
  input        = var.vpc_config.public_subnets
  result_count = 1
}

resource "aws_instance" "bastion_host" {
  ami                         = local.bastion_host_config.ami_id
  associate_public_ip_address = true
  instance_type               = local.bastion_host_config.instance_type
  key_name                    = local.bastion_host_config.ssh_key_name
  security_groups             = [aws_security_group.bastion_sg.id]
  subnet_id                   = random_shuffle.az.result[0]
  depends_on = [
    aws_security_group.bastion_sg,
    random_shuffle.az
  ]
  tags = merge(
    var.tags,
    {
      Name = join("_", [var.tags.name, "bastion_host"])
    }
  )
}
