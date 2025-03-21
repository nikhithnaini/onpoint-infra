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
  default     = true
}

# variable "key_vault_key_id" {
#   description = "The key vault key id"
#   type        = string
#   default     = ""
# }
# variable "key_vault_id" {
#   description = "The key vault id"
#   type        = string
# }
# # variable "key_name" {
# #   description = "The key name"
# #   type        = string
# # }
# variable "key_vault_uri" {
#   description = "The key vault uri"
#   type        = string
# }