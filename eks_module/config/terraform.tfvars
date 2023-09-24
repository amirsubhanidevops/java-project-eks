
aws_eks_cluster_config = {

      "demo-cluster" = {

        eks_cluster_name         = "demo-cluster1"
        eks_subnet_ids = ["subnet-010bd108a64ab6f4a","subnet-03d98bb8b8974e1cc","subnet-0a86822b14a43d7f7","subnet-0c1b93c4f065347ed"]
        tags = {
             "Name" =  "demo-cluster"
         }  
      }
}

eks_node_group_config = {

  "node1" = {

        eks_cluster_name         = "demo-cluster"
        node_group_name          = "mynode"
        nodes_iam_role           = "eks-node-group-general1"
        node_subnet_ids          = ["subnet-010bd108a64ab6f4a","subnet-03d98bb8b8974e1cc","subnet-0a86822b14a43d7f7","subnet-0c1b93c4f065347ed"]

        tags = {
             "Name" =  "node1"
         } 
  }
}