variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string  
  
}

variable "location" {
  description = "Location for the virtual network"
  type        = string  
  
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string  
  
}

variable "tags" {
  description = "Tags for the virtual network"
  type        = map(string)  
  
}