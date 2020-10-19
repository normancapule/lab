variable aws_profile {
  type = string
  default = "sp-archi2"
}

variable aws_region {
  type = string
  default = "ap-southeast-2"
}

variable amis {
  type = map(string)
  default = {
    ap-southeast-2 = "ami-091469e4fdf00e0ab"
  }
}
