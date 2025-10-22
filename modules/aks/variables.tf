variable "name_prefix" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "aks_subnet_id" {
  type = string
}

variable "system_node_count" {
  type    = number
  default = 2
}

variable "system_vm_size" {
  type    = string
  default = "Standard_B2ms"
}

variable "enable_monitoring" {
  type    = bool
  default = true
}

variable "log_analytics_workspace_id" {
  type    = string
  default = ""
}

variable "aks_admin_group_object_ids" {
  type    = list(string)
  default = []
}

