resource aws_key_pair main_key {
  key_name = "main_key"
  public_key = file(var.path_to_public_key)
}

resource aws_instance ec2 {
  ami = var.amis[var.aws_region]
  instance_type = "t2.micro"
  key_name = aws_key_pair.main_key.key_name

  # uploads file to remote
  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }

  # executes sh commands
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh",  # Remove the spurious CR characters.
      "sudo /tmp/script.sh"
    ]
  }

  connection {
    host = coalesce(self.public_ip, self.private_ip)
    type = "ssh"
    user = var.instance_username
    private_key = file(var.path_to_private_key)
  }
}
