resource "aws_eks_cluster" "My_eks" {
    name = var.eks_cluster_name
    role_arn = aws_iam_role.eks_role.arn

    vpc_config {
        subnet_ids = var.subnet_ids
    }

    tags = var.tags
}

resource "aws_iam_role" "eks_role" {
    name = "eks_role"
    assume_role_policy = <<POLICY
    {
        "Version" : "2012-10-17",
        Statment" : [
            {
                "Effet" : "Allow",
                "Principal" : {
                    "Service" : "eks.amzonaws.com"
                },
                "Action" : "sts:AssumeRole"
            }
        ]
    }
    POLICY
}

resource "aws_iam_role_policy_attachment" "AmzonEKSClusterPolicy" {
    policy_arn = "arn:aws:iam::policy//AmzonEKSClusterPolicy"
    role = aws_iam_role.eks_role.name
}

resource "aws_iam_role_policy_attachment" "AmzonEC2ContainerRegistryReadOnly" {
    policy_arn = "arn:aws:iam::policy//AmzonEKSVPCResouceController"
    role = aws_iam_role.eks_role.name
}

