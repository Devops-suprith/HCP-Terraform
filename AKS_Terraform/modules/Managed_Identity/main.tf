resource "azurerm_user_assigned_identity" "this" {
  name     = "${var.prefix}-uami"
  location = var.location
  resource_group_name = var.resource_group_name
}