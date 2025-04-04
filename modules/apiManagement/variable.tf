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
variable "apisubnet_id" {
    description = "The ID of the subnet"
    type        = string
}
variable "fqdn" {
    description = "The FQDN of the subnet"
    type        = string
  
}
variable "apiname" {
    description = "name of api subnet"
    type = string
  
}