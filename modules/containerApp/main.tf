resource "azurerm_container_app" "example" {
  name                         = var.containerName
  container_app_environment_id = var.container_app_environment_id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  tags = {
    for key, value in var.tags : key => value
  }

 ingress {
    external_enabled = true  
    target_port      = 80   
    transport        = "auto" 

    traffic_weight {  
      latest_revision = true  
      percentage      = 100   
    }
  }

  template {
    container {
      name   = var.acrName
      image  = "nginx:latest"  
      cpu    = 0.25
      memory = "0.5Gi"
      env {
        name  = "APPLICATIONINSIGHTS_CONNECTION_STRING"
        value = var.app_insights_connection_string
      }
    }
  }
}
