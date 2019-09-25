# Private

resource "aws_route_table" "private_route_table" {
  vpc_id = "${aws_vpc.network.id}"

  tags {
    Name = "Private route table ${var.network_fqdn}"
  }

  depends_on = ["aws_vpc.network"]
}

resource "aws_route" "private_route" {
  route_table_id         = "${aws_route_table.private_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id   = "${aws_network_interface.LAN.id}"

  depends_on = ["aws_vpc.network", "aws_route_table.private_route_table", "aws_network_interface.LAN"]
}

resource "aws_route_table_association" "private_nat"{
  subnet_id = "${aws_subnet.network_private_zone.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"

  depends_on = ["aws_subnet.network_private_zone", "aws_route_table.private_route_table"]
}
