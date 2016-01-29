resource "aws_vpc" "opsworks_vpc" {
    cidr_block = "192.168.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "false"
    tags {
      Name = "opsworks_vpc"
    }
}
