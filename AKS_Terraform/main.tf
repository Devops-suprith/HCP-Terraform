module "rg" {
  source = "./modules/resourceGroup"
  prefix = var.prefix
  location = var.location
}

module "network" {
  source = "./modules/networking"
  prefix = var.prefix
  location = module.rg.location
  resource_group_name = module.rg.name
}

module "uami" {
  source = "./modules/Managed_Identity"
  prefix = var.prefix
  location = module.rg.location
  resource_group_name = module.rg.name
}

data "azurerm_subscription" "current" {}

resource "azurerm_role_assignment" "uami_network_contibutor" {
  scope = module.network.aks_subnet_id
  role_definition_name = "Network Contributor"
  principal_id = module.uami.principal_id
}

variable "kubernetes_version" {
  type    = string
  default = "1.31.100" # adjust to current supported
}

module "aks" {
  source              = "./modules/aks"
  cluster_name        = "${var.prefix}-aks"
  location            = module.rg.location
  resource_group_name = module.rg.name
  dns_prefix          = "${var.prefix}-dns"
  kubernetes_version  = var.kubernetes_version
  aks_subnet_id       = module.network.aks_subnet_id

  uami_id        = module.uami.id
  uami_client_id = module.uami.client_id
}