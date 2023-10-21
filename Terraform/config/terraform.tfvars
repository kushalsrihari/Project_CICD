region = "us-east-1"

access_key = "AKIA5PFZMOTFU6EK7QPD"

secret_key = "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"

vpc_config = {
    vpc01 = {
        vpc_cidr_block = "192.168.0.0/16"
        tags = {
            "Name" = "My_vpc"
        }
    }
}

subnet_config = {
    "Public-us-east-1a" = {

        vpc_name = "vpc01"
        cidr_block = "192.168.0.0/18"
        availability_zone = "us-east-1a"
        tags = {
            "Name" = "Public-1"
        }
    }

    "Public-us-east-1b" = {

        vpc_name = "vpc01"
        cidr_block = "192.168.64.0/18"
        availability_zone = "us-east-1b"
        tags = {
            "Name" = "Public-2"
        }
    }

    "Private-us-east-1a" = {

        vpc_name = "vpc01"
        cidr_block = "192.168.128.0/18"
        availability_zone = "us-east-1a"
        tags = {
            "Name" = "Private-1"
        }
    }

    "Private-us-east-1b" = {

        vpc_name = "vpc01"
        cidr_block = "192.168.192.0/18"
        availability_zone = "us-east-1b"
        tags = {
            "Name" = "Private-2"
        }
    }
}

internet_GW_cofig = {
    igw01 = {
        vpc_name = "vpc01"
        tags = {
            "name" = "MY_IGW"
        }
    }
}

elastic_IP_config = {
    eip01 = {
        tags = {
            "Name" = "nat01"
        }
    }

    eip02 = {
        tags = {
            "Name" = "nat02"
        }
    }
}

nat_GW_config = {
    natgw01 = {
        eip_name = "eip01"
        subnet_name = "Public-us-east-1a"
        tags = {
            "Name" = "natgw01"
        }
    }

    natgw02 = {
        eip_name = "eip02"
        subnet_name = "Public-us-east-1b"
        tags = {
            "Name" = "natgw02"
        }   
        
    }
}

route_table_config = {
    RT01 = {
        private = 0
        vpc_name = "vpc01"
        gateway_name = "igw01"

        tags = {
            "Name" = "Public-Route"
        }
    }

    RT02 = {
        private = 1
        vpc_name = "vpc01"
        gateway_name = "natgw01"

        tags = {
            "Name" = "Private-Route"
        }
        
    }

    RT03 = {
        private = 1
        vpc_name = "vpc01"
        gateway_name = "natgw02"

        tags = {
            "Name" = "Private-Route"
        }
        
    }

}

route_table_association_config = {

    RT01Assoc = {
        subnet_name = "Public-us-east-1a"
        route_table_name = "RT01"
    }

    RT02Assoc = {
        subnet_name = "Public-us-east-1b"
        route_table_name = "RT01"
    }

    RT03Assoc = {
        subnet_name = "Private-us-east-1a"
        route_table_name = "RT02"
    }

    RT04Assoc = {
        subnet_name = "Private-us-east-1b"
        route_table_name = "RT03"
    }

}

aws_eks_cluster_config = {

    "demo-key" = {
        eks_cluster_name = "demo-cluster"

        subnet1 = "Public-us-east-1a"
        subnet2 = "Public-us-east-1b"
        subnet3 = "Private-us-east-1a"
        subnet4 = "Private-us-east-1b"

        tags = {
            "Name" = "demo-cluster"
        }
    }
}

aws_eks_node_group_config = {
    
    "node1" = {
        node_group_name = "node1"
        eks_cluster_name = "demo-key"

        node_iam_role = "eks_node_genral1"

        subnet1 = "Private-us-east-1a"
        subnet2 = "Private-us-east-1b"

        tags = {
            "Name" = "node1"
        }
    }

    "node2" = {
        node_group_name = "node2"
        eks_cluster_name = "demo-key"

        node_iam_role = "eks_node_genral1"

        subnet1 = "Private-us-east-1a"
        subnet2 = "Private-us-east-1b"

        tags = {
            "Name" = "node1"
        }
    }

}