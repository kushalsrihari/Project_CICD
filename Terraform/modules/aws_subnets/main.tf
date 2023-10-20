resource "aws_subnet" "main" {
    vpc_id = aws_vpc.main.vpc_id
    cidr_block = var.cidr_blocks

    availability_zone = var.availability_zone

    tags = var.tags
}

