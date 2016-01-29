resource "aws_iam_role" "opsworks-service-role" {
    name = "opsworks-service-role"
    assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "opsworks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
resource "aws_iam_role_policy" "opsworks-service-policy" {
    name = "opsworks-service-policy"
    role = "${aws_iam_role.opsworks-service-role.id}"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "ec2:*",
                "iam:PassRole",
                "cloudwatch:GetMetricStatistics",
                "cloudwatch:DescribeAlarms",
                "ecs:*",
                "elasticloadbalancing:*",
                "rds:*"
            ],
            "Effect": "Allow",
            "Resource": ["*"]
        }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "opsworks-ec2-profile" {
    name = "opsworks-profile"
    roles = ["${aws_iam_role.opsworks-ec2-role.name}"]
}
resource "aws_iam_role" "opsworks-ec2-role" {
    name = "opsworks-codedeploy"
    assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
