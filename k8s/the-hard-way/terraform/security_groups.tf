# Security Groups

resource "aws_security_group" "kubernetes" {
  vpc_id = aws_vpc.vpc.id
  name   = "kubernetes"
  tags = {
    Name = "${var.app_name}_sg_kubernetes"
  }
}

resource "aws_security_group_rule" "kubernetes_ingress_1" {
  security_group_id = aws_security_group.kubernetes.id
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["11.0.0.0/16"]
}

resource "aws_security_group_rule" "kubernetes_ingress_2" {
  security_group_id = aws_security_group.kubernetes.id
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["11.200.0.0/16"]
}

resource "aws_security_group_rule" "kubernetes_ingress_22" {
  security_group_id = aws_security_group.kubernetes.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "kubernetes_ingress_6443" {
  security_group_id = aws_security_group.kubernetes.id
  type              = "ingress"
  from_port         = 6443
  to_port           = 6443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "kubernetes_ingress_443" {
  security_group_id = aws_security_group.kubernetes.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "kubernetes_ingress_icmp" {
  security_group_id = aws_security_group.kubernetes.id
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
}
