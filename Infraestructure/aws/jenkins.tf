#Instances ec2 for Jenkins
resource "aws_instance" "Jenkins" {
  count         = "${var.Jenkins_number}"
  ami           = "${var.image_type}"
  instance_type = "${var.instance_type_Jenkins}"
  subnet_id     = "${aws_subnet.network_private_zone.id}"
  key_name      = "${var.deployer-key-name}"

  root_block_device {
    volume_size = "${var.Jenkins_disk_size}"
    volume_type = "${var.Jenkins_disk_type}"
  }

  vpc_security_group_ids = [
    "${aws_security_group.sg_vpc.id}",
    "${aws_security_group.sg_private.id}",
  ]

  tags {
    Name  = "Jenkins${count.index + 1}.${var.network_fqdn}"
    Group = "Jenkins"
  }

  depends_on = ["aws_subnet.network_private_zone"]
}
