data "template_file" "ssh_config" {
  template = "${file("../templates/ssh_config.tpl")}"

  depends_on = ["aws_instance.bastion_host"]

  vars {
    jump_fip = "${aws_instance.bastion_host.public_ip}"
    jump_key = "${var.ansible-deployer-key-file}"
  }
}

resource "null_resource" "ssh_config" {
  triggers {
    template_rendered = "${ data.template_file.ssh_config.rendered }"
  }

  provisioner "local-exec" {
    command = "echo '${ data.template_file.ssh_config.rendered }' > ../../ansible/ssh_config"
  }

  provisioner  "local-exec" {
    command = "python ../../../create_inventory/ec2.py > inventory.json"
  }

  provisioner  "local-exec" {
    command = "python ../../../create_inventory/generate_ansible_hosts.py > ../../ansible/ansible_hosts"
  }

  depends_on = ["aws_instance.bastion_host", 
                "aws_instance.logstash", 
                "aws_instance.kibana", 
                "aws_instance.Jenkins",
                "aws_instance.elasticsearch"
                ]
}
