resource "aws_network_acl" "networkaclprivatec" {
  vpc_id     = "${aws_vpc.main.id}"
  subnet_ids = ["${element(aws_subnet.private.*.id,2)}"]

  egress {
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    protocol   = "all"
  }

  ingress {
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    protocol   = "all"
  }

  tags = "${merge(var.common_tags,
    map("Type", "NetworkAclPrivateC"),
    map("Name", "${var.account_name}-NetworkAcl-Private-${element(aws_subnet.private.*.id,2)}"))}"
}
