#Instances ec2 for elasticsearch
resource "aws_instance" "elasticsearch" {
  count         = "${var.elasticsearch_number}"
  ami           = "${var.image_type}"
  instance_type = "${var.instance_type_elasticsearch}"
  subnet_id     = "${aws_subnet.network_private_zone.id}"
  key_name      = "${var.deployer-key-name}"

  vpc_security_group_ids = [
    "${aws_security_group.sg_vpc.id}",
    "${aws_security_group.sg_private.id}",
  ]

  root_block_device {
    volume_size = "${var.elasticsearch_disk_size}"
    volume_type = "${var.elasticsearch_disk_type}"
  }

  tags {
    Name  = "elasticsearch-${count.index + 1}.${var.network_fqdn}"
    Group = "Elasticsearch"
  }

  depends_on = ["aws_subnet.network_private_zone"]
}
