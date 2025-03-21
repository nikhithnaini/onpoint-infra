variable "keyVaultName" {
  description = "The name of the key vault"
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
variable "tenant_id" {
  description = "The tenant id"
  type        = string
}
variable "enabled_for_disk_encryption" {
  description = "Is the key vault enabled for disk encryption"
  type        = bool
  default     = false
}
variable "soft_delete_retention_days" {
  description = "The soft delete retention days"
  type        = number
  default     = 7
}
variable "purge_protection_enabled" {
  description = "Is purge protection enabled"
  type        = bool
  default     = false
}
variable "enable_rbac_authorization" {
  description = "Is RBAC authorization enabled"
  type        = bool
  default     = true
}
variable "sku_name" {
  description = "The SKU name"
  type        = string
  default     = "standard"
}
variable "tags" {
  description = "A map of tags to add to the key vault"
  type        = map(string)
}