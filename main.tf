resource "aws_elb" "opsworks-elb" {
    name = "opsworks-elb"
    subnets = [
        "${aws_subnet.public-a.id}",
        "${aws_subnet.public-c.id}"
    ]
    security_groups = ["${aws_security_group.elb.id}"]

    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }
    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 3
        target = "HTTP:80/"
        interval = 5
    }
    cross_zone_load_balancing = true
    instances = [
    ]
    tags {
        Name = "opsworks-elb"
    }
}
