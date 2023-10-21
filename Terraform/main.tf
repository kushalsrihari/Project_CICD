module "vpc_modules" {

    source = "./modules/aws_vpc"

    for_each = var.vpc_config

    vpc_cidr_block = each.value.vpc_cidr_block
    tags = each.value.tags
}

module "aws_subnet" {

    source = "./modules/aws_subnets"

    for_each = var.subnet_config

    vpc_id = module.vpc_modules[each.value.vpc_name].vpc_id
    cidr_block = each.value.cidr_block
    availability_zone = each.value.availability_zone
    tags = each.value.tags

}


module "internetGW_module" {
    source = "./modules/aws_internetGW"

    for_each = var.internet_GW_cofig

    vpc_id = module.vpc_modules[each.value.vpc_name].vpc_id
    tags = each.value.tags
}

module "NatGW_Module" {
    source = "./modules/aws_natGW"

    for_each = var.nat_GW_config

    elasticIP_id = module.Elastic_IP_Module[each.value.eip_name].elastic_IP_id
    subnet_id = module.aws_subnet[each.value.subnet_name].subnet_id
    tags = each.value.tags
}

module "Elastic_IP_Module" {
    source = "./modules/aws_elastic_IP"

    for_each = var.elastic_IP_config

    tags = each.value.tags
}


module "route_table_module" {
    source = "./modules/aws_route_table"

    for_each = var.route_table_config

    vpc_id = module.vpc_modules[each.value.vpc_name].vpc_id
    internetGW_id = each.value.private == 0 ? module.internetGW_module[each.value.gateway_name].internetGW_id : module.nat_GW_config[each.value.gateway_name].natGW_id
    tags = each.value.tags 
}


module "route_table_association" {
    source = "./modules/aws_route_table_association"

    for_each = var.route_table_association_config

    subnet_id = module.aws_subnet[each.value.subnet_name].subnet_id
    route_table_id = module.route_table_module[each.value.route_table_name].route_table_id
}