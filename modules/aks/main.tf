resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.name_prefix}-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.name_prefix

  # ✅ Enable OIDC & Workload Identity (required for GitHub OIDC)
  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  default_node_pool {
    name                       = "system"
    node_count                 = var.system_node_count
    vm_size                    = var.system_vm_size
    vnet_subnet_id             = var.aks_subnet_id
    only_critical_addons_enabled = false

    # Optional: Node labels/tags (good practice)
    node_labels = {
      "role" = "system"
      "env"  = "dev"
    }
  }

  # ✅ Managed Identity for control plane
  identity {
    type = "SystemAssigned"
  }

  # ✅ Azure AD RBAC integration
  azure_active_directory_role_based_access_control {
    admin_group_object_ids = var.aks_admin_group_object_ids
    azure_rbac_enabled     = true
  }

  # ✅ Monitoring Integration (Log Analytics)
  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  # ✅ Metrics Monitoring
  monitor_metrics {}

  # ✅ Network configuration
  network_profile {
    network_plugin    = "azure"
    network_policy    = "calico"
    load_balancer_sku = "standard"
  }

  # ✅ Tags for visibility & governance
  tags = {
    environment = "dev"
    project     = "aks-devops-platform"
    managed_by  = "Terraform"
  }

  # Optional but good practice:
  lifecycle {
    ignore_changes = [
      # This prevents Terraform from reapplying changes when Azure modifies internal OIDC URLs
      oidc_issuer_url,
    ]
  }
}

