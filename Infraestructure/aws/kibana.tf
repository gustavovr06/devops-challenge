#Instance ec2 for kibana
resource "aws_instance" "kibana" {
  count         = "${var.kibana_number}"
  ami           = "${var.image_type}"
  instance_type = "${var.instance_type_kibana}"
  subnet_id     = "${aws_subnet.network_public_zone.id}"
  key_name      = "${var.deployer-key-name}"

  vpc_security_group_ids = [
    "${aws_security_group.sg_vpc.id}",
  ]

  root_block_device {
    volume_size = "${var.kibana_disk_size}"
    volume_type = "${var.kibana_disk_type}"
  }

  tags {
    Group = "Kibana"
  }

  depends_on = ["aws_subnet.network_public_zone", "aws_instance.bastion_host"]
}
