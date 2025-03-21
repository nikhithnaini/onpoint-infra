variable "acrName" {
  description = "The name of the Azure Container Registry"
  type        = string
  
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string 
}
variable "location" {
  description = "The location of the resource group"
  type        = string
}
variable "sku" {
  description = "The SKU of the Azure Container Registry"
  type        = string
  default     = "Basic"
}
variable "admin_enabled" {
  description = "Is admin enabled"
  type        = bool
  default     = false
  
}
variable "tags" {
  description = "A map of tags to add to the key vault"
  type        = map(string)
}