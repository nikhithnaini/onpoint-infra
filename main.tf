module "resourceGroup" {
  source = "./modules/resourceGroup"
  resource_group_name = var.resource_group_name
  location = var.location
  tags = {
    for key, value in var.tags : key => value
  }
}
module "vnet" {
  source = "./modules/virtualNetwork"
  vnet_name = var.vnet_name
  location = module.resourceGroup.location
  resource_group_name = module.resourceGroup.resource_group_name
  tags = {
    for key, value in var.tags : key => value
  }
}

module "subnet" {
  source = "./modules/subnet"
  subnet_name = var.subnet_name
  api_name = var.api_name
  api_subnet_address_prefixes = var.api_subnet_address_prefixes
  location = module.resourceGroup.location
  resource_group_name = module.resourceGroup.resource_group_name
  vnet_name = module.vnet.vnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
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
  infrastructure_subnet_id = module.subnet.subnet_id
  log_analytics_workspace_id = module.logWorkspace.log_analytics_workspace_id
  depends_on = [
    module.logWorkspace ,
    module.subnet.subnet_name # Ensures Log Analytics is created before this
  ]
    

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

module "apiManagement" {
  source = "./modules/apiManagement"
  apiname = var.apiname
  location = module.resourceGroup.location
  resource_group_name = module.resourceGroup.resource_group_name
  tags = {
    for key, value in var.tags : key => value
  }
  apisubnet_id = module.subnet.apisubnet_id
  fqdn = module.containerApp.fqdn
  
}
module "networkSecurityGroup" {
  source = "./modules/networkSecurityGroup"
  nsg_name = var.nsg_name
  container_nsg_name = var.container_nsg_name
  location = module.resourceGroup.location
  resource_group_name = module.resourceGroup.resource_group_name
  apisubnet_id = module.subnet.apisubnet_id
  container_subnet_id = module.subnet.subnet_id
  }
