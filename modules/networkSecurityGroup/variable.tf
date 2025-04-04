variable "location" {
  description = "The location of the resource group"
  type        = string

  
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string 

  
}
variable "apisubnet_id" {
  description = "The ID of the APIM subnet"
  type        = string
  
}
variable "nsg_name" {
  description = "The name of the NSG"
  type        = string
  
}
variable "container_nsg_name" {
  description = "The name of the container NSG"
  type        = string
  
}

variable "container_subnet_id" {
  description = "The ID of the Container App subnet"
  type        = string
  
}