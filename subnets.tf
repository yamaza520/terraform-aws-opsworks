resource "aws_subnet" "public-a" {
    vpc_id = "${aws_vpc.opsworks_vpc.id}"
    cidr_block = "192.168.10.0/24"
    availability_zone = "ap-northeast-1a"
    tags {
        Name = "public-a"
    }
}
resource "aws_subnet" "private-a" {
    vpc_id = "${aws_vpc.opsworks_vpc.id}"
    cidr_block = "192.168.15.0/24"
    availability_zone = "ap-northeast-1a"
    tags {
        Name = "private-a"
    }
}
resource "aws_subnet" "public-c" {
    vpc_id = "${aws_vpc.opsworks_vpc.id}"
    cidr_block = "192.168.20.0/24"
    availability_zone = "ap-northeast-1c"
    tags {
        Name = "public-c"
    }
}
resource "aws_subnet" "private-c" {
    vpc_id = "${aws_vpc.opsworks_vpc.id}"
    cidr_block = "192.168.25.0/24"
    availability_zone = "ap-northeast-1c"
    tags {
        Name = "private-c"
    }
}

resource "aws_route_table_association" "puclic-a" {
    subnet_id = "${aws_subnet.public-a.id}"
    route_table_id = "${aws_route_table.public-route.id}"
}
resource "aws_route_table_association" "puclic-c" {
    subnet_id = "${aws_subnet.public-c.id}"
    route_table_id = "${aws_route_table.public-route.id}"
}

resource "aws_db_subnet_group" "subnet-rds" {
    name = "subnet-rds"
    description = "subnet rds"
    subnet_ids = [
        "${aws_subnet.private-a.id}",
        "${aws_subnet.private-c.id}",
    ]
    tags {
        Name = "subnet-rds"
    }
}
