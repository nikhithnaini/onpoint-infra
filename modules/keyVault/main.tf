resource "azurerm_key_vault" "name" {
  name                        = var.keyVaultName
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled
  enable_rbac_authorization   = var.enable_rbac_authorization
  sku_name = var.sku_name
  tags = {
    for key, value in var.tags : key => value
  }
}