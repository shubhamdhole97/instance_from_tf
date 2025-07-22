data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

resource "aws_instance" "ubuntu_instances" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = data.aws_subnets.selected.ids[count.index % length(data.aws_subnets.selected.ids)]
  vpc_security_group_ids = [var.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              # Update packages
              apt-get update -y

              # Install Docker
              curl -fsSL https://get.docker.com | bash
              chmod 777 /var/run/docker.sock

              # Install Java 17
              apt-get install -y openjdk-17-jdk

              # Install Maven
              apt-get install -y maven
              EOF

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "Ubuntu-Instance-${count.index + 1}"
  }
}
