resource "aws_launch_template" "this" {

  name_prefix = "${var.instance_name}-"

  image_id = "ami-05ffe3c48a9991133"

  instance_type = var.instance_type

  vpc_security_group_ids = [
    var.ec2_sg_id
  ]

  user_data = base64encode(
    templatefile("${path.module}/userdata.sh", {
      docker_image = var.docker_image
      db_endpoint  = var.db_endpoint
      db_username  = var.db_username
      db_password  = var.db_password

    })
  )

  tag_specifications {

    resource_type = "instance"

    tags = {
      Name = var.instance_name
    }
  }
}

resource "aws_autoscaling_group" "this" {

  name = "${var.instance_name}-asg"

  desired_capacity = 2

  min_size = 2

  max_size = 4

  vpc_zone_identifier = var.public_subnet_ids

  target_group_arns = [
    var.target_group_arn
  ]

  launch_template {

    id = aws_launch_template.this.id

    version = "$Latest"
  }

  health_check_type = "ELB"

  health_check_grace_period = 300

  tag {

    key = "Name"

    value = var.instance_name

    propagate_at_launch = true
  }
}