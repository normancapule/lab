provider aws {
  version = "~> 3.11"
  region = var.aws_region
  profile = var.aws_profile
}

resource aws_instance ec2 {
  ami = var.amis[var.aws_region]
  instance_type = "t2.micro"
}
