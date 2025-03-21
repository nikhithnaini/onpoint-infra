variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string 
}
variable "location" {
  description = "The location of the resource group"
  type        = string
}
variable "tags" {
  description = "A map of tags to add to the resource group"
  type        = map(string)
}
variable "tenant_id" {
  description = "The tenant id"
  type        = string 
}
variable "keyVaultName" {
  description = "The name of the key vault"
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
  default     = false
}
variable "storageAccountName" {
  description = "The name of the storage account"
  type        = string
  
}
variable "account_tier" {
  description = "The storage account tier"
  type        = string
  default     = "Standard"
}
variable "account_replication_type" {
  description = "The storage account replication type"
  type        = string
  default     = "LRS"
}
variable "enable_blob_encryption" {
  description = "Is blob encryption enabled"
  type        = bool
  default     = false
}
variable "delete_retention_days" {
  description = "The number of days to retain deleted blobs"
  type        = number
  default     = 7
}
variable "enable_queue_encryption" {
  description = "Is queue encryption enabled"
  type        = bool
  default     = false
}
variable "queue_cmk_status" {
  description = "The status of the queue encryption key"
  type        = string
  default     = "Microsoft.Storage"
}
variable "enable_table_encryption" {
  description = "Is table encryption enabled"
  type        = bool
  default     = false
}
variable "table_cmk_status" {
  description = "The status of the table encryption key"
  type        = string
  default     = "Microsoft.Storage"
}
variable "hns_enabled" {
  description = "Is hierarchical namespace enabled"
  type        = bool
  default     = false
}
variable "acrName" {
  description = "The name of the Azure Container Registry"
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
variable "logWorkspaceName" {
  description = "The name of the Log Analytics Workspace"
  type        = string
}
variable "envName" {
  description = "The name of the environment"
  type        = string
}
variable "containerName" {
  description = "The name of the container"
  type        = string
}
variable "app_insights_name" {
  description = "The name of the Application Insights"
  type        = string
  
}
# variable "container_app_environment_id" {
#   description = "The ID of the Log Analytics Workspace"
#   type        = string
  
# }
# variable "app_insights_connection_string" {
#   description = "The connection string of the Application Insights instance"
#   type        = string
  
# }