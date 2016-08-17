resource "aws_security_group" "default" {
  name = "default-artirix"
  description = "Default security group that allows inbound and outbound traffic from all instances in the VPC"
  vpc_id = "${aws_vpc.default.id}"

  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    self        = true
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    self        = true
  }

  tags { 
    Name = "artirix-default-vpc" 
  }
}

resource "aws_security_group" "nat" {
  name = "nat-artirix"
  description = "Security group for nat instances that allows SSH and VPN traffic from internet. Also allows outbound HTTP[S]"
  vpc_id = "${aws_vpc.default.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags { 
    Name = "nat-artirix" 
  }
}

resource "aws_security_group" "elastics" {
  name = "elastics-artirix"
  description = "Security group for Elasticsearch that allows traffic from internet"
  vpc_id = "${aws_vpc.default.id}"

  ingress {
    from_port = 9200
    to_port   = 9200
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags { 
    Name = "elastics-artirix" 
  }
}
