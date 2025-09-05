output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "app_url" {
  value = "http://${aws_instance.web_server.public_ip}:5000"
}
