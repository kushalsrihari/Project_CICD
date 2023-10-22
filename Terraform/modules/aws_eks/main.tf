resource "aws_eks_cluster" "example"{
    name = var.eks_cluster_name
    role_arn = aws_iam_role.eks_role.arn

    vpc_config {
        subnet_ids = var.subnet_ids
    }

    depends_on = [
        aws_iam_role_policy_attachment.AmzonEKSClusterPolicy,
        aws_iam_role_policy_attachment.AmzonEKSVPCResouceController,
    ]

    tags = var.tags
}

resource "aws_iam_role" "eks_cluster"{
    name = "eks_cluster"
    
    assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "AmzonEKSClusterPolicy" {
    policy_arn = "arn:aws:iam::policy//AmzonEKSClusterPolicy"
    role = aws_iam_role.eks_cluster.name
}

resource "aws_iam_role_policy_attachment" "AmzonEC2ContainerRegistryReadOnly" {
    policy_arn = "arn:aws:iam::policy//AmzonEKSVPCResouceController"
    role = aws_iam_role.eks_cluster.name
}

