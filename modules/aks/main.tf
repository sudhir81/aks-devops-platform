###########################################################
# 🚀 Azure Kubernetes Service (AKS) Module
# Compatible with azurerm v4.49.0
###########################################################

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.name_prefix}-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.name_prefix

  # ✅ Security / Identity Features
  oidc_issuer_enabled       = var.enable_oidc_issuer
  workload_identity_enabled = var.enable_workload_identity

  # ========================================================
  # 🧩 Node Pool
  # ========================================================
  default_node_pool {
    name                         = "system"
    node_count                   = var.system_node_count
    vm_size                      = var.system_vm_size
    vnet_subnet_id               = var.aks_subnet_id
    only_critical_addons_enabled = false
  }

  # ========================================================
  # 🔐 Identity
  # ========================================================
  identity {
    type = "SystemAssigned"
  }

  # ========================================================
  # 🔒 Azure AD RBAC
  # ========================================================
  azure_active_directory_role_based_access_control {
    admin_group_object_ids = var.aks_admin_group_object_ids
    azure_rbac_enabled     = true
  }

  # ========================================================
  # 📊 Monitoring (Log Analytics)
  # ========================================================
  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  # ========================================================
  # 📈 Metrics Monitoring
  # ========================================================
  monitor_metrics {}

  # ========================================================
  # 🌐 Networking
  # ========================================================
  network_profile {
    network_plugin    = "azure"
    network_policy    = "calico"
    load_balancer_sku = "standard"
  }

  # ========================================================
  # 🏷️ Tags
  # ========================================================
  tags = {
    environment = "dev"
    project     = "aks-devops-platform"
    managed_by  = "Terraform"
  }

  # ========================================================
  # ⚙️ Lifecycle Rules
  # ========================================================
  lifecycle {
    ignore_changes = [oidc_issuer_url]
  }
}

###########################################################
# ✅ Outputs for cross-module reference
###########################################################

#output "aks_id" {
#  value = azurerm_kubernetes_cluster.aks.id
#}

#output "aks_cluster_name" {
#  value = azurerm_kubernetes_cluster.aks.name
#}

#output "kube_config" {
#  value     = azurerm_kubernetes_cluster.aks.kube_admin_config_raw
#  sensitive = true
#}

