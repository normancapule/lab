variable path_to_public_key {}
variable path_to_private_key {}
variable instance_username {
  default = "ubuntu"
}
variable aws_profile {
  default = "sp-archi2"
}
variable aws_region {
  default = "ap-southeast-2"
}
variable amis {
  default = {
    ap-southeast-2 = "ami-0f158b0f26f18e619"
  }
}
