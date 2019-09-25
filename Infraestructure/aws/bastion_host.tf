#Instances ec2 for bastion_host
resource "aws_instance" "bastion_host" {
  count         = "${var.bastion_host_number}"
  ami           = "${var.image_type_bastion_host}"
  instance_type = "${var.instance_type_bastion_host}"
  key_name      = "${var.deployer-key-name}"

  //network
  subnet_id                   = "${aws_subnet.network_public_zone.id}"
  private_ip                  = "${var.bastion_host_private_ip}"

  vpc_security_group_ids = [
    "${aws_security_group.sg_vpc.id}",
  ]

  root_block_device {
    volume_size = "${var.bastion_host_disk_size}"
    volume_type = "${var.bastion_host_disk_type}"
  }

  tags {
    Name  = "${var.bastion_host_name}.${var.network_fqdn}"
    Group = "bastion_host"
  }

  depends_on = ["aws_subnet.network_public_zone"]
}
