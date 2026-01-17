variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-lab-southcentral"
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "southcentralus"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.1.0.0/16"]
}

variable "subnets" {
  type = map(string)
  default = {
    "snet-management" = "10.1.0.0/28"
    }
}

variable "environment" {
  description = "Target environment (e.g., Dev, Prod, Lab)"
  type        = string
  default     = "Lab"
}