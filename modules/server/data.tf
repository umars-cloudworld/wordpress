data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["public_subnet_1"]
  }
}

data "aws_security_group" "selected" {
  filter {
    name   = "tag:Name"
    values = ["Security Group"]
  }
}