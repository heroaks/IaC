resource "aws_key_pair" "ec2" {
  key_name   = "${var.project_name}-key"
  public_key = file("${path.module}/keys/terraform-ec2.pem.pub")

  tags = {
    Name = "${var.project_name}-key"
  }
}
