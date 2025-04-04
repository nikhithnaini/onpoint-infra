variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string  
  
}
variable "subnet_name" {
  description = "Name of the subnet"
  type        = string  
  
}
variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)  
  
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
variable "api_name" {
  description = "name of api subnet"
  type = string
}
variable "api_subnet_address_prefixes" {
  description = "Address prefixes for the api subnet"
  type = list(string)
  
}