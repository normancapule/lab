# Nginx Application Load Balancer

resource "aws_lb" "kubernetes" {
  name               = "kubernetes-lb"
  load_balancer_type = "network"
  subnets            = [aws_subnet.public_1.id]
  tags = {
    Name = "${var.app_name}-kubernetes-nlb"
  }
}

resource "aws_lb_target_group" "kubernetes_6443" {
  name        = "kubernetes"
  port        = 6443
  protocol    = "TCP"
  vpc_id      = aws_vpc.vpc.id
  target_type = "ip"

  tags = {
    Name = "${var.app_name}-kubernetes-nlb-target-group"
  }
}

resource "aws_lb_target_group_attachment" "kubernetes_6443_0" {
  target_group_arn = aws_lb_target_group.kubernetes_6443.arn
  target_id        = "11.0.1.10"
}

resource "aws_lb_target_group_attachment" "kubernetes_6443_1" {
  target_group_arn = aws_lb_target_group.kubernetes_6443.arn
  target_id        = "11.0.1.11"
}

resource "aws_lb_target_group_attachment" "kubernetes_6443_2" {
  target_group_arn = aws_lb_target_group.kubernetes_6443.arn
  target_id        = "11.0.1.12"
}

resource "aws_lb_listener" "kubernetes_443" {
  load_balancer_arn = aws_lb.kubernetes.id
  port              = 443
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.kubernetes_6443.id
    type             = "forward"
  }
}
