module "network" {
  source              = "../../modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  name_prefix         = var.name_prefix
  vnet_address_space  = var.vnet_address_space
  aks_subnet_prefixes = var.aks_subnet_prefixes
}

module "monitoring" {
  source              = "../../modules/monitoring"
  name_prefix         = var.name_prefix
  resource_group_name = module.network.resource_group_name
  location            = module.network.location
}

module "aks" {
  source                     = "../../modules/aks"
  name_prefix                = var.name_prefix
  resource_group_name        = module.network.resource_group_name
  location                   = module.network.location
  aks_subnet_id              = module.network.aks_subnet_id
  enable_monitoring          = var.enable_monitoring
  log_analytics_workspace_id = module.monitoring.log_analytics_workspace_id
  aks_admin_group_object_ids = var.aks_admin_group_object_ids
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "azurerm_container_registry" "acr" {
  name                = "${var.name_prefix}acr${random_id.suffix.hex}"
  resource_group_name = module.network.resource_group_name
  location            = module.network.location
  sku                 = "Basic"
  admin_enabled       = true
}

