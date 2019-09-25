##################################################
## Security/Network Definition: Security Groups ##
##################################################

#######################################################################
# Security Group Private Instances
#######################################################################

resource "aws_security_group" "sg_private" {
  name        = "sg_private_zone"
  description = "Security Group for private instances"
  vpc_id      = "${aws_vpc.network.id}"

  tags {
    Name = "sg Private Zone"
  }

  depends_on = ["aws_vpc.network"]
}

resource "aws_security_group_rule" "ssh_privates" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_private.id}"

  depends_on = ["aws_security_group.sg_private"]
}

resource "aws_security_group_rule" "syslog_tcp" {
  type        = "ingress"
  from_port   = 5140
  to_port     = 5140
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_private.id}"

  depends_on = ["aws_security_group.sg_private"]
}

resource "aws_security_group_rule" "syslog_udp" {
  type        = "ingress"
  from_port   = 5140
  to_port     = 5140
  protocol    = "udp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_private.id}"

  depends_on = ["aws_security_group.sg_private"]
}

resource "aws_security_group_rule" "mesos_private" {
  type        = "ingress"
  from_port   = 5051
  to_port     = 5051
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_private.id}"
  depends_on        = ["aws_security_group.sg_private"]
}

resource "aws_security_group_rule" "admin_router_private_http" {
  type        = "ingress"
  from_port   = 61001
  to_port     = 61001
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_private.id}"
  depends_on        = ["aws_security_group.sg_private"]
}

resource "aws_security_group_rule" "admin_router_private_https" {
  type        = "ingress"
  from_port   = 61002
  to_port     = 61002
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_private.id}"
  depends_on        = ["aws_security_group.sg_private"]
}

resource "aws_security_group_rule" "mesos_task_1_private" {
  type        = "ingress"
  from_port   = 1025
  to_port     = 2180
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_private.id}"
  depends_on        = ["aws_security_group.sg_private"]
}

resource "aws_security_group_rule" "mesos_task_2_private" {
  type        = "ingress"
  from_port   = 2182
  to_port     = 3887
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_private.id}"
  depends_on        = ["aws_security_group.sg_private"]
}

resource "aws_security_group_rule" "mesos_task_3_private" {
  type        = "ingress"
  from_port   = 3889
  to_port     = 5049
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_private.id}"
  depends_on        = ["aws_security_group.sg_private"]
}

resource "aws_security_group_rule" "mesos_task_4_private" {
  type        = "ingress"
  from_port   = 5052
  to_port     = 8079
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_private.id}"
  depends_on        = ["aws_security_group.sg_private"]
}

resource "aws_security_group_rule" "mesos_task_5_private" {
  type        = "ingress"
  from_port   = 8082
  to_port     = 8180
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_private.id}"
  depends_on        = ["aws_security_group.sg_private"]
}

resource "aws_security_group_rule" "mesos_task_6_private" {
  type        = "ingress"
  from_port   = 8182
  to_port     = 32000
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_private.id}"
  depends_on        = ["aws_security_group.sg_private"]
}

resource "aws_security_group_rule" "private_egress_all" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_private.id}"
  depends_on        = ["aws_security_group.sg_private"]
}
