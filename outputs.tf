output "instance_public_ip" {
  value = module.ec2.instance_public_ip
}

output "app_url" {
  value = module.ec2.app_url
}
