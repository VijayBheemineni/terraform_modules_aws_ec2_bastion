<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | = 4.2.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bastion"></a> [bastion](#module\_bastion) | ../../terraform_modules_aws_ec2_bastion | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_host_config"></a> [bastion\_host\_config](#input\_bastion\_host\_config) | n/a | `map` | <pre>{<br>  "ami_id": "ami-0c293f3f676ec4f90",<br>  "instance_type": "t3.nano",<br>  "ssh_key_name": "ssh_keys_poc"<br>}</pre> | yes |
| <a name="input_bastion_sg_config"></a> [bastion\_sg\_config](#input\_bastion\_sg\_config) | n/a | `map` | <pre>{<br>  "security_group_rules": [<br>    {<br>      "cidr_block": "10.1.0.0/16",<br>      "description": "SSH from private ip address network space",<br>      "from_port": 22,<br>      "protocol": "tcp",<br>      "to_port": 22<br>    },<br>    {<br>      "cidr_block": "1.2.3.4/32",<br>      "description": "SSH from public ip address",<br>      "from_port": 22,<br>      "protocol": "tcp",<br>      "to_port": 22<br>    }<br>  ]<br>}</pre> | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | <pre>{<br>  "name": "App1_Test"<br>}</pre> | yes |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | n/a | `map` | <pre>{<br>  "public_subnets": [<br>    "subnet-0d3d2170aa5e3d8e8",<br>    "subnet-0c37c4a3749c58279"<br>  ],<br>  "vpc_id": "vpc-019277b882e78157d"<br>}</pre> | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_public_ip"></a> [bastion\_public\_ip](#output\_bastion\_public\_ip) | n/a |
| <a name="output_bastion_sg"></a> [bastion\_sg](#output\_bastion\_sg) | n/a |
<!-- END_TF_DOCS -->