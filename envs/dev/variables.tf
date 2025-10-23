###########################################################
# 🌍 Environment Core Variables
###########################################################

variable "resource_group_name" {
  description = "Name of the resource group for AKS deployment."
  type        = string
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
}

variable "name_prefix" {
  description = "Prefix used for all resource names (e.g., dev, prod)."
  type        = string
}

###########################################################
# 🌐 Networking Configuration
###########################################################

variable "vnet_address_space" {
  description = "The address space of the Virtual Network."
  type        = list(string)
}

variable "aks_subnet_prefixes" {
  description = "The subnet prefixes for AKS node pool."
  type        = list(string)
}

###########################################################
# ⚙️ AKS Cluster Configuration
###########################################################

variable "system_node_count" {
  description = "Number of nodes in the system node pool."
  type        = number
  default     = 1
}

variable "system_vm_size" {
  description = "VM size for AKS nodes."
  type        = string
  default     = "Standard_D2s_v3"
}

###########################################################
# 📊 Monitoring & Logging
###########################################################

variable "enable_monitoring" {
  description = "Enable monitoring and Log Analytics integration."
  type        = bool
  default     = true
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics workspace resource ID."
  type        = string
  default     = ""
}

###########################################################
# 🔐 Azure AD / RBAC Integration
###########################################################

variable "aks_admin_group_object_ids" {
  description = "List of Azure AD group object IDs with admin rights on AKS."
  type        = list(string)
  default     = []
}

###########################################################
# 🧩 Feature Flags
###########################################################

variable "enable_oidc_issuer" {
  description = "Enable OIDC issuer for AKS."
  type        = bool
  default     = true
}

variable "enable_workload_identity" {
  description = "Enable workload identity federation for AKS."
  type        = bool
  default     = true
}

###########################################################
# 🏷️ Tags
###########################################################

variable "tags" {
  description = "Common tags to apply to all resources."
  type        = map(string)
  default = {
    environment = "dev"
    project     = "aks-devops-platform"
    managed_by  = "Terraform"
  }
}

