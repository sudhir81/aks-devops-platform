# === Environment Configuration ===
resource_group_name = "dev-rg"
location            = "centralus" # ✅ change region (eastus is blocking SKUs)
name_prefix         = "dev"

# === Network Configuration ===
vnet_address_space  = ["10.1.0.0/16"]
aks_subnet_prefixes = ["10.1.1.0/24"]

# === AKS Cluster Settings ===
system_node_count = 1                 # ✅ keep minimal to save credits
system_vm_size    = "Standard_D2s_v3" # ⚠️ note lowercase "v" — Azure is case-sensitive

# === Monitoring / Logging ===
enable_monitoring          = true
log_analytics_workspace_id = ""

# === RBAC / Security ===
aks_admin_group_object_ids = []

