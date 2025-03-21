module "resourceGroup" {
  source = "./modules/resourceGroup"
  resource_group_name = var.resource_group_name
  location = var.location
  tags = {
    for key, value in var.tags : key => value
  }
}
module "keyVault" {
  source              = "./modules/keyVault"
  keyVaultName     = var.keyVaultName
  resource_group_name = module.resourceGroup.resource_group_name
  location            = module.resourceGroup.location
  tenant_id           = var.tenant_id
  tags = {
        for key, value in var.tags : key => value
  }
}

module "storageAccount" {
  source = "./modules/storageAccount"
  storageAccountName = var.storageAccountName
  resource_group_name = module.resourceGroup.resource_group_name
  location = module.resourceGroup.location
  account_tier = var.account_tier
  account_replication_type = var.account_replication_type
  hns_enabled = var.hns_enabled
  delete_retention_days = var.delete_retention_days
  
  tags = {
    for key, value in var.tags : key => value
  }
}

module "acrName" {
  source = "./modules/azureContainerRegistry"
  acrName = var.acrName
  resource_group_name = module.resourceGroup.resource_group_name
  location = module.resourceGroup.location
  tags = {
    for key, value in var.tags : key => value
  }
}
module "logWorkspace" {
  source = "./modules/logAnalytics"
  logWorkspaceName = var.logWorkspaceName
  resource_group_name = module.resourceGroup.resource_group_name
  location = module.resourceGroup.location
  tags = {
    for key, value in var.tags : key => value
  }
}
module "envName" {
  source = "./modules/containerEnv"
  envName = var.envName
  resource_group_name = module.resourceGroup.resource_group_name
  location = module.resourceGroup.location
  log_analytics_workspace_id = module.logWorkspace.log_analytics_workspace_id
  tags = {
    for key, value in var.tags : key => value
  }
  
}

module "containerApp" {
  source = "./modules/containerApp"
  containerName =  var.containerName
  acrName = var.acrName
  container_app_environment_id = module.envName.container_app_environment_id
  resource_group_name          = var.resource_group_name
  tags = {
    for key, value in var.tags : key => value
  }
  app_insights_connection_string = module.appInsights.app_insights_connection_string
}
module "appInsights" {
  source = "./modules/appInsights"
  app_insights_name = var.app_insights_name
  resource_group_name = module.resourceGroup.resource_group_name
  location = module.resourceGroup.location
  log_analytics_workspace_id = module.logWorkspace.log_analytics_workspace_id

  tags = {
    for key, value in var.tags : key => value
  }
  
}