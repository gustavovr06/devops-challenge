// VPC
resource "aws_vpc" "network" {
  cidr_block           = "${var.vpc_1_cidr}"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags {
    Name = "Network ${var.network_fqdn}"
  }

  depends_on = ["aws_key_pair.key-deployer"]
}

//Public Zone

resource "aws_subnet" "network_public_zone" {
  vpc_id            = "${aws_vpc.network.id}"
  cidr_block        = "${var.network_public_zone}"
  availability_zone = "${var.aws_region_network}"

  tags {
    Name = "Network Public subnet ${var.network_fqdn}"
  }

  depends_on = ["aws_vpc.network"]
}

//Private Zone

resource "aws_subnet" "network_private_zone" {
  vpc_id            = "${aws_vpc.network.id}"
  cidr_block        = "${var.network_private_zone}"
  availability_zone = "${var.aws_region_network}"

  depends_on = ["aws_vpc.network"]
}

