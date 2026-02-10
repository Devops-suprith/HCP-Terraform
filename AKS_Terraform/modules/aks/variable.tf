variable "cluster_name"        { type = string }
variable "location"            { type = string }
variable "resource_group_name" { type = string }
variable "dns_prefix"          { type = string }
variable "kubernetes_version"  { type = string }
variable "aks_subnet_id"       { type = string }

variable "uami_id"        { type = string }
variable "uami_client_id" { type = string }
