//Public 

resource "aws_internet_gateway" "public_zone" {
  vpc_id = "${aws_vpc.network.id}"

  tags {
    Name = "Public ${var.network_fqdn}"
  }

  depends_on = ["aws_vpc.network"]
}

resource "aws_route_table" "public_zone" {
  vpc_id = "${aws_vpc.network.id}"

  tags {
    Name = "Public ${var.network_fqdn}"
  }

  depends_on = ["aws_vpc.network"]
}

resource "aws_route" "public_zone" {
  route_table_id         = "${aws_route_table.public_zone.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.public_zone.id}"

  depends_on = ["aws_vpc.network", "aws_route_table.public_zone", "aws_internet_gateway.public_zone"]
}

resource "aws_route_table_association" "public_zone" {
  subnet_id      = "${aws_subnet.network_public_zone.id}"
  route_table_id = "${aws_route_table.public_zone.id}"

  depends_on = ["aws_subnet.network_public_zone", "aws_route_table.public_zone"]
}
