resource "aws_opsworks_stack" "opsworks-web-blue" {
    depends_on = [
        "aws_iam_role.opsworks-service-role",
        "aws_iam_instance_profile.opsworks-ec2-profile"
    ]

    name = "opsworks-web-blue"
    color = "rgb(45, 114, 184)"
    region = "${var.region}"
    vpc_id = "${aws_vpc.opsworks_vpc.id}"
    default_subnet_id = "${aws_subnet.public-a.id}"
    service_role_arn = "${aws_iam_role.opsworks-service-role.arn}"
    default_instance_profile_arn = "${aws_iam_instance_profile.opsworks-ec2-profile.arn}"

    default_os = "Amazon Linux 2015.09"
    default_ssh_key_name = "yamaza"

    configuration_manager_name = "Chef"
    configuration_manager_version = "11.10"
    use_custom_cookbooks = true
    custom_cookbooks_source = {
        type = "git"
        url  = "https://github.com/yamaza520/opsworks-cookbook.git"
    }
    manage_berkshelf = true
    berkshelf_version = "3.2.0"
}
resource "aws_opsworks_static_web_layer" "web-blue" {
    stack_id = "${aws_opsworks_stack.opsworks-web-blue.id}"
    custom_security_group_ids = [
        "${aws_security_group.admin.id}",
        "${aws_security_group.web.id}"
    ]
    auto_assign_public_ips = true
}

resource "aws_opsworks_stack" "opsworks-web-green" {
    depends_on = [
        "aws_iam_role.opsworks-service-role",
        "aws_iam_instance_profile.opsworks-ec2-profile"
    ]

    name = "opsworks-web-green"
    color = "rgb(57, 131, 94)"
    region = "${var.region}"
    vpc_id = "${aws_vpc.opsworks_vpc.id}"
    default_subnet_id = "${aws_subnet.public-c.id}"
    service_role_arn = "${aws_iam_role.opsworks-service-role.arn}"
    default_instance_profile_arn = "${aws_iam_instance_profile.opsworks-ec2-profile.arn}"

    default_os = "Amazon Linux 2015.09"
    default_ssh_key_name = "yamaza"

    configuration_manager_name = "Chef"
    configuration_manager_version = "11.10"
    use_custom_cookbooks = true
    custom_cookbooks_source = {
        type = "git"
        url  = "https://github.com/yamaza520/opsworks-cookbook.git"
    }
    manage_berkshelf = true
    berkshelf_version = "3.2.0"
}
resource "aws_opsworks_static_web_layer" "web-green" {
    stack_id = "${aws_opsworks_stack.opsworks-web-green.id}"
    auto_assign_public_ips = true
}
