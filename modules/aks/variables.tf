##############################
# AKS Core Configuration
##############################

variable "name_prefix" {
  description = "Prefix used for AKS and related resources."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group in which AKS will be deployed."
  type        = string
}

variable "location" {
  description = "Azure region for the AKS cluster."
  type        = string
}

##############################
# Networking
##############################

variable "aks_subnet_id" {
  description = "Subnet ID for AKS nodes."
  type        = string
}

##############################
# Node Pool
##############################

variable "system_node_count" {
  description = "Number of nodes in the system node pool."
  type        = number
  default     = 2
}

variable "system_vm_size" {
  description = "VM size for the system node pool."
  type        = string
  default     = "Standard_B2ms"
}

##############################
# Monitoring & Logging
##############################

variable "enable_monitoring" {
  description = "Enable monitoring with Log Analytics."
  type        = bool
  default     = true
}

variable "log_analytics_workspace_id" {
  description = "Existing Log Analytics Workspace ID. Leave blank to auto-create."
  type        = string
  default     = ""
}

##############################
# Azure AD RBAC
##############################

variable "aks_admin_group_object_ids" {
  description = "List of Azure AD Group Object IDs for AKS Admins."
  type        = list(string)
  default     = []
}

##############################
# Security & Workload Identity
##############################

variable "enable_oidc_issuer" {
  description = "Enable OIDC issuer for AKS (required for workload identity)."
  type        = bool
  default     = true
}

variable "enable_workload_identity" {
  description = "Enable Azure Workload Identity integration for AKS."
  type        = bool
  default     = true
}

