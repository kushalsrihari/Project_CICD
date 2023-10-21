resource "aws_eks_node_group "eks_node" {
    cluster_name = var.eks_cluster_name
    node_group_name = var.node_group_name
    node_role_arn = aws_iam_role.eks_node.arn
    subnet_ids = aws_subnet.example[*].subnet_id

    scaling_config {
        desired_size = 1
        max_size = 2
        min_size = 1
    }

    update_config {
        max_unavailable = 1
    }

    depends_on = [
        aws_iam_role_policy_attachments.eks_node-AmzonEKSWorkerNodePolicy,
        aws_iam_role_policy_attachments.eks_node-AmzonEKS_CNI_Policy,
        aws_iam_role_policy_attachments.eks_node-AmzonEC2ContainerRegistryReadOnly,
    ]
}

variable "eks_cluster_name" {

}

variable "node_group_name" {

}