# Create the Resource Group
resource "azurerm_resource_group" "lab" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Create a Virtual Network
resource "azurerm_virtual_network" "lab_vnet" {
  name                = "vnet-lab-01"
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
}


resource "azurerm_subnet" "lab_subnets" {
  for_each             = var.subnets
  name                 = each.key    # Takes "snet-management", etc.
  address_prefixes     = [each.value] # Takes "10.1.0.0/28", etc.
  
  resource_group_name  = azurerm_resource_group.lab.name
  virtual_network_name = azurerm_virtual_network.lab_vnet.name
}