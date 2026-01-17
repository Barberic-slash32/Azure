output "resource_group_id" {
  description = "The ID of the created Resource Group"
  value       = azurerm_resource_group.lab.id
}

output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.lab_vnet.id
}

output "vnet_name" {
  description = "The name of the Virtual Network"
  value       = azurerm_virtual_network.lab_vnet.name
}