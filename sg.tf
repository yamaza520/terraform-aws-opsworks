resource "aws_security_group" "elb" {
    name = "elb"
    description = "Allow traffic for elb"
    vpc_id = "${aws_vpc.opsworks_vpc.id}"
    ingress {
        protocol = "tcp"
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        protocol = "tcp"
        from_port = 80
        to_port = 80
        cidr_blocks = [
            "${aws_subnet.public-a.cidr_block}",
            "${aws_subnet.public-c.cidr_block}",
        ]
    }
    tags {
        Name = "opsworks-elb"
    }
}
resource "aws_security_group" "admin" {
    name = "admin"
    description = "Allow SSH inbound traffic"
    vpc_id = "${aws_vpc.opsworks_vpc.id}"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
        Name = "opsworks-admin"
    }
}

resource "aws_security_group" "web" {
    name = "web"
    description = "Allow traffic for web"
    vpc_id = "${aws_vpc.opsworks_vpc.id}"
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
        Name = "opsworks-web"
    }
}
