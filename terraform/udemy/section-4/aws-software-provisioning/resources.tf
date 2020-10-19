resource aws_key_pair main_key {
  key_name = "main_key"
  public_key = "ssh-rsa "
}

resource aws_instance ec2 {
  ami = var.amis[var.aws_region]
  instance_type = "t2.micro"
  key_name = aws_key_pair.main_key.key_name
}
