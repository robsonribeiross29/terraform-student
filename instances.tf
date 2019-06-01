resource "aws_instance" "AD-2K12" {
  ami                    = "${var.instance_ami_2k12r2}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.sg_3389.id}"]
  subnet_id              = "${aws_subnet.subnet_public.id}"
  key_name               = "terraform-key"
  get_password_data      = "true"
  connection {
    password = "${rsadecrypt(self.password_data, file("${var.key-pair}"))}"
  }
  tags = {
    Name        = "AD-2K12R2"
    Environment = "${var.environment_tag}"
  }
}

resource "aws_instance" "AD-2K16" {
  ami                    = "${var.instance_ami_2k16}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.sg_3389.id}"]
  subnet_id              = "${aws_subnet.subnet_public.id}"
  key_name               = "terraform-key"
  get_password_data      = "true"
  connection {
    password = "${rsadecrypt(self.password_data, file("${var.key-pair}"))}"
  }
  tags = {
    Name        = "FS-2K16"
    Environment = "${var.environment_tag}"
  }
}
