resource "aws_security_group" "carol_sec-grps" {
  name        = "carol_allow_rules"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.carol-vpc.id

  tags = {
    Name = "carol_firewall_rules_final"
  }
}

#allow all outgoing rules for ipv4
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.carol_sec-grps.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.carol_sec-grps.id

  cidr_ipv4   ="0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_http" {
  security_group_id = aws_security_group.carol_sec-grps.id
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}