resource "aws_key_pair" "key-deployer" {
  key_name   = "${var.deployer-key-name}"
  public_key = "${file("${var.deployer-key-file}.pub")}"
}
