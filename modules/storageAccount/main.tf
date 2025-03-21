resource "azurerm_storage_account" "example" {
  name                     = lower(var.storageAccountName)  # Storage account name must be lowercase
  resource_group_name       = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  is_hns_enabled=var.hns_enabled
  https_traffic_only_enabled = true
   
  
  blob_properties {
    delete_retention_policy {
      days = var.delete_retention_days
    }
    container_delete_retention_policy {
      days = var.delete_retention_days
    }
  }

  tags = {
    for key, value in var.tags : key => value
  }
}

