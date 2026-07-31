resource "aws_instance" "this" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.ec2.id]
  associate_public_ip_address = true

  key_name = aws_key_pair.ec2.key_name

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp3"
    delete_on_termination = true
    encrypted = true
  }

  tags = {
    Name = "${var.project_name}-${var.environment}"
  }
}
