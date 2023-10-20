resource "aws_vpc" "main" {
    cidr_block  =   var.vpc_cidr_blocks
    tags    =   var.tags
}



