resource "azurerm_kubernetes_cluster" "this" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  sku_tier    = "Premium"
  support_plan = "AKSLongTermSupport"

  identity {
    type         = "UserAssigned"
    identity_ids = [var.uami_id]
  }

  default_node_pool {
    name                = "systemnp"
    node_count          = 1
    vm_size             = "Standard_DC2s_v3"
    vnet_subnet_id      = var.aks_subnet_id
    orchestrator_version = var.kubernetes_version
    type                = "VirtualMachineScaleSets"
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "standard"
  }

  role_based_access_control_enabled = true

  lifecycle {
    ignore_changes = [
      default_node_pool[0].node_count
    ]
  }
}
