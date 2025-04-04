# resource "azurerm_cdn_frontdoor_profile" "frontdoor" {
#   name                = "onpoint-frontdoor"
#   resource_group_name = "Koyetech-Sanbox-rg"
#   sku_name            = "Standard_AzureFrontDoor" # Change to Standard_AzureFrontDoor if needed
# }

# # resource "azurerm_cdn_frontdoor_endpoint" "frontdoor_endpoint" {
# #   name                     = "myfrontendpoint"
# #   cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor.id
# # }

# # resource "azurerm_cdn_frontdoor_origin_group" "origin_group" {
# #   name                     = "containerapp-origin-group"
# #   cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor.id
# #   session_affinity_enabled = false

# #   health_probe {
# #     interval_in_seconds = 30
# #     protocol            = "Https"
# #     path                = "/"
# #   }

# #   load_balancing {
# #     sample_size = 4
# #     successful_samples_required = 3
# #   }
# # }

# # resource "azurerm_cdn_frontdoor_origin" "container_app_origin" {
# #   name                          = "container-app-origin"
# #   cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.origin_group.id
# #   enabled                       = true
# #   host_name                     = azurerm_container_app.example.latest_revision_fqdn
# #   priority                      = 1
# #   weight                        = 1000
# #   certificate_name_check_enabled = false  # Set to true if using HTTPS

# #   private_link {
# #     request_message = "Requesting Private Link access"
# #   }
# # }

# # resource "azurerm_cdn_frontdoor_route" "route" {
# #   name                          = "containerapp-route"
# #   cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.frontdoor_endpoint.id
# #   cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.origin_group.id
# #   enabled                       = true
# #   forwarding_protocol           = "MatchRequest"
# #   https_redirect_enabled        = true
# #   patterns_to_match             = ["/*"]
# #   supported_protocols           = ["Http", "Https"]
# #   link_to_default_domain        = true
# # }
