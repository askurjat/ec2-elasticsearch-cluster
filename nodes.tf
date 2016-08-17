resource "aws_instance" "node" {
  count = 2
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.private.id}"
  security_groups = ["${aws_security_group.default.id}"]
  key_name = "${aws_key_pair.deployer.key_name}"
  source_dest_check = false
  user_data = "${file("cloud-config/node.yml")}"
  tags = { 
    Name = "artirix-node-${count.index}"
  }
}

resource "aws_elb" "node" {
  name = "artirix-elb"
  subnets = ["${aws_subnet.public.id}"]
  security_groups = ["${aws_security_group.default.id}", "${aws_security_group.elastics.id}"]
  listener {
    instance_port = 9200
    instance_protocol = "http"
    lb_port = 9200
    lb_protocol = "http"
  }
  instances = ["${aws_instance.node.*.id}"]
}
