resource "aws_lb_target_group" "tudproj-TG" {
  name     = "tudproj-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  tags = {
    Name = "tudproj-TG"
  }

}

resource "aws_lb_target_group_attachment" "tudproj-attach" {
  count            = length(aws_instance.webinstance)
  target_group_arn = aws_lb_target_group.tudproj-TG.arn
  target_id        = aws_instance.webinstance[count.index].id
  port             = 80
}

resource "aws_lb_listener" "tudproj-Listener" {
  load_balancer_arn = aws_lb.tudproj-LB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tudproj-TG.arn
  }
}


resource "aws_lb" "tudproj-LB" {
  name               = "tudproj-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow-http.id]
  subnets            = [aws_subnet.public_eu_west_1a.id, aws_subnet.public_eu_west_1b.id]

  enable_deletion_protection = false

  tags = {
    Name = "tudproj-LB"
  }
}
