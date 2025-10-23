# ===========================================================
# 🌍 Environment Configuration
# ===========================================================
resource_group_name = "dev-rg"
location            = "centralus"
name_prefix         = "dev"

# ===========================================================
# 🌐 Network Configuration
# ===========================================================
vnet_address_space  = ["10.1.0.0/16"]
aks_subnet_prefixes = ["10.1.1.0/24"]

# ===========================================================
# ⚙️ AKS Cluster Settings
# ===========================================================
system_node_count = 1
system_vm_size    = "Standard_D2s_v3"

# Enable modern AKS features
enable_oidc_issuer       = true
enable_workload_identity = true

# ===========================================================
# 📊 Monitoring / Logging
# ===========================================================
enable_monitoring          = true
log_analytics_workspace_id = ""  # Terraform will link automatically if monitoring module is used

# ===========================================================
# 🔐 RBAC / Security
# ===========================================================
# Replace with your Azure AD Group Object ID for AKS Admins
aks_admin_group_object_ids = [
  "4c6f434a-5e85-4646-b856-a5b564b3028d"
]

# ===========================================================
# 🏷️ Metadata (optional but helpful)
# ===========================================================
tags = {
  owner       = "Sudhir"
  environment = "dev"
  project     = "aks-devops-platform"
}

