variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "aks_subnet_prefixes" {
  type = list(string)
}

variable "system_node_count" {
  type = number
}

variable "system_vm_size" {
  type = string
}

variable "enable_monitoring" {
  type = bool
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "aks_admin_group_object_ids" {
  type = list(string)
}

