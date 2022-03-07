output "bastion_sg" {
  value = module.bastion.bastion_sg
}

output "bastion_public_ip" {
  value = module.bastion.bastion_host_public_ip
}
