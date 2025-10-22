variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "name_prefix" { type = string }
variable "vnet_address_space" { type = list(string) }
variable "aks_subnet_prefixes" { type = list(string) }