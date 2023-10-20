module "vpc_modules" {

    source = "./modules/aws_vpc"

    for_each = var.vpc_config

    vpc_cidr_blocks = each.value.vpc_cidr_blocks
    tags = each.value.tags
}

module "aws_subnet" {

    source = "./modules/aws_subnets"

    for_each = var.subnet_config

    vpc_id = module.vpc_modules[each.value.vpc_name].vpc_id
    cidr_blocks = each.value.cidr_blocks
    availability_zone = each.value.availability_zone
    tags = each.value.tags

}