output "alb_arn" {
  value = aws_lb.this.arn
}

output "alb_dns_name" {
  value = aws_lb.this.dns_name
}

output "lb_name" {
  value = aws_lb.this.name
}

output "lb_arn_suffix" {
  value = aws_lb.this.arn_suffix
}

output "target_group_name" {
  value = aws_lb_target_group.this.name
}

output "target_group_arn_suffix" {
  value = aws_lb_target_group.this.arn_suffix
}

output "target_group_arn" {
  value = aws_lb_target_group.this.arn
}
