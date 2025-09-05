resource "aws_key_pair" "deployer_key" {
  key_name   = "terraform-key"
  public_key = file(var.key_path)
}

resource "aws_instance" "web_server" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = aws_key_pair.deployer_key.key_name
  associate_public_ip_address = true

  user_data = <<-EOF
#!/bin/bash
yum update -y
yum install -y python3 python3-pip git
pip3 install flask
git clone https://github.com/Samudini-Chamodya/entertainment-app.git /home/ec2-user/entertainment-app
cd /home/ec2-user/entertainment-app
nohup python3 app.py > app.log 2>&1 &
EOF

  tags = { Name = "entertainment-server" }
}
