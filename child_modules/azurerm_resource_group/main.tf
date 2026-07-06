resource "azurerm_resource_group" "rg_names" {
for_each = var.rgs
name = each.value.name
location = each.value.location
}