#Instance ec2 for logstash
resource "aws_instance" "logstash" {
  count         = "${var.logstash_number}"
  ami           = "${var.image_type}"
  instance_type = "${var.instance_type_logstash}"
  subnet_id     = "${aws_subnet.network_private_zone.id}"
  key_name      = "${var.deployer-key-name}"

  vpc_security_group_ids = [
    "${aws_security_group.sg_vpc.id}",
    "${aws_security_group.sg_private.id}",
  ]

  root_block_device {
    volume_size = "${var.logstash_disk_size}"
    volume_type = "${var.logstash_disk_type}"
  }

  tags {
    Name  = "logstash-${count.index + 1}.${var.network_fqdn}"
    Group = "Logstash"
  }

  depends_on = ["aws_subnet.network_private_zone"]
}
