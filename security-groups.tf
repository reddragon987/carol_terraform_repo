resource "aws_security_group" "carol_sec_grp" {
  name        = "allow_rules"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.carol_vpc.id

  tags = {
    Name = "carol_firewall_rules"
  }
}

#allow all outgoing rules for ipv4
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.carol_sec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.carol_sec_grp

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.carol_sec_grp

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}