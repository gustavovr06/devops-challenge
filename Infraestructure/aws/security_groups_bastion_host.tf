##################################################
## Security/Network Definition: Security Groups ##
##################################################

#######################################################################
# Security Group bastion_host Instances
#######################################################################

resource "aws_security_group" "sg_bastion_host" {
  name        = "SG_bastion_host"
  description = "Security Group for bastion_host instances"
  vpc_id      = "${aws_vpc.network.id}"

  tags {
    Name = "SG bastion_host"
  }

  depends_on = ["aws_vpc.network"]
}

resource "aws_security_group_rule" "ssh_bastion_host" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_bastion_host.id}"
  depends_on        = ["aws_security_group.sg_bastion_host"]
}
