resource "aws_internet_gateway" "opsworks_gw" {
    vpc_id = "${aws_vpc.opsworks_vpc.id}"
    tags {
        Name = "opsworks-gw"
    }
}

resource "aws_route_table" "public-route" {
    vpc_id = "${aws_vpc.opsworks_vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.opsworks_gw.id}"
    }
    tags {
        Name = "public-route"
    }
}
