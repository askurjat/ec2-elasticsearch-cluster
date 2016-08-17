output "node.0.ip" {
  value = "${aws_instance.node.0.private_ip}"
}

output "node.1.ip" {
  value = "${aws_instance.node.1.private_ip}"
}

output "nat.ip" {
  value = "${aws_instance.nat.public_ip}"
}

output "elb.hostname" {
  value = "${aws_elb.node.dns_name}"
}
