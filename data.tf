data "aws_ami" "amazon_linux2_ami" {
  most_recent = true
  filter {
    name = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
  owners = ["amazon"]
}