<!-- BEGIN_TF_DOCS -->
## Description
    This module creates a bastion host. The instance chooses a random public subnet from provided public subnets list.
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.bastion_host](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.bastion_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [random_shuffle.az](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/shuffle) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_host_config"></a> [bastion\_host\_config](#input\_bastion\_host\_config) | n/a | <pre>object({<br>    ami_id        = string<br>    ssh_key_name  = string<br>    instance_type = string<br>  })</pre> | n/a | yes |
| <a name="input_bastion_sg_config"></a> [bastion\_sg\_config](#input\_bastion\_sg\_config) | n/a | <pre>object({<br>    security_group_rules = list(object({<br>      from_port   = number,<br>      to_port     = number,<br>      protocol    = string,<br>      cidr_block  = string,<br>      description = string<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | n/a | yes |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | n/a | <pre>object({<br>    vpc_id         = string<br>    public_subnets = list(string)<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_host_public_ip"></a> [bastion\_host\_public\_ip](#output\_bastion\_host\_public\_ip) | n/a |
| <a name="output_bastion_sg"></a> [bastion\_sg](#output\_bastion\_sg) | n/a |
<!-- END_TF_DOCS -->