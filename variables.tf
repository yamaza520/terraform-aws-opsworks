variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {
    default = "ap-northeast-1"
}

variable "images" {
    default = {
        ec2-ap-northeast-1 = "ami-cbf90ecb"
        ecs-ap-northeast-1 = "ami-8aa61c8a"
    }
}
