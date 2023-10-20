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