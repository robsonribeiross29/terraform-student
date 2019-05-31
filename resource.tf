resource "aws_vpc" "pim" {
  cidr_block           = "${var.cidr_vpc}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "main"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.pim.id}"
  tags = {
    Environment = "${var.environment_tag}"
  }
}

resource "aws_subnet" "subnet_public" {
  vpc_id                  = "${aws_vpc.pim.id}"
  cidr_block              = "${var.cidr_subnet}"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.availability_zone}"
  tags = {
    Environment = "${var.environment_tag}"
  }
}

resource "aws_route_table" "rtb_public" {
  vpc_id = "${aws_vpc.pim.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags = {
    Environment = "${var.environment_tag}"
  }
}

resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = "${aws_subnet.subnet_public.id}"
  route_table_id = "${aws_route_table.rtb_public.id}"
}

resource "aws_security_group" "sg_3389" {
  name   = "sg_3389"
  vpc_id = "${aws_vpc.pim.id}"
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Environment = "${var.environment_tag}"
  }
}

resource "aws_instance" "fist-example" {
  ami                    = "${var.instance_ami}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.sg_3389.id}"]
  subnet_id              = "${aws_subnet.subnet_public.id}"
  connection {
    type     = "winrm"
    user     = "Administrator"
    password = "${var.admin_password}"
  }
  user_data = <<EOF
    <powershell>
    # Set Administrator password
    $admin = [adsi]("WinNT://./administrator, user")
    $admin.psbase.invoke("SetPassword", "${var.admin_password}")
    </powershell>
    EOF
  tags = {
    Environment = "${var.environment_tag}"
  }
}
// TODO: CREATE KEY PAIR
resource "aws_key_pair" "windowskey" {
  key_name = "publicKey"
  public_key = "${file(var.public_key_path)}"
}
