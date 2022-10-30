variable "cluster_name" {}
variable "eks_role_arn" {}
variable "eks_cluster_master_subnet" {
    type=list(string)
}
variable "eks_cluster_nodegroup_subnet" {
    type = list(string)
}
variable "instance_max_node_size" {}
variable "instance_disired_node_size" {}
variable "instance_min_node_size" {}
variable "instance_type_list" {
    type=list(string)
}