# terraform-aws-opsworks
terraform-aws-opsworks

terraformでopsworksの周りを作成
 * vpc
 * subnet
 * gw
 * iam
 * sg
 * elb
 * opsworks
  * stack
  * web layer

shellではBlueGreenの切り替えのみ

# terraform

terraform.tfvarsで下記を宣言。
作成できるのはStackとLayerまでなのでinstance作成はできない。。。

```
aws_access_key = "xxxxxx"
aws_secret_key = "yyyyyy"
```

のち

```
terraform apply
```

# shells

aws opsworks cliでいろいろ操作。
instanceに関して今回は手動で作成したがコマンドでもできそう。（未確認）
