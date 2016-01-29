output "elb" {
  value = "http://${aws_elb.opsworks-elb.dns_name}/"
}
