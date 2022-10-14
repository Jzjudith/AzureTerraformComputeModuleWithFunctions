output "resource_group_name" {
  description = "The name which should be used for this Resource Group"
  value       = azurerm_resource_group.example.name
}

output "location" {
  description = "The name of the location"
  value       = azurerm_resource_group.example.location
}

output "virtual_network_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.example.name
}

output "cidr_space" {
  description = "The address space to use for the subnet."
  value       = azurerm_virtual_network.example.address_space
}

output "cidr_prefixes" {
  description = "The address prefixes to use for the subnet."
  value = tomap({ for k, s in azurerm_subnet.example : k => s.address_prefixes })
}

output "subnet_ids" {
  description = "The ids of the subnet"
  value       = tomap({ for k, s in azurerm_subnet.example : k => s.id })
}

output "public_ip_name" {
  description = "The name of the Public IP."
  value       = azurerm_public_ip.example[*].name
}

output "public_ip_address" {
  description = "The name of the Public IP."
  value       = azurerm_public_ip.example[*].ip_address
}

output "public_ip_address_id" {
  description = "The value of the public ip address id"
  value       = azurerm_public_ip.example[*].id
}

output "network_interface_ids" {
  description = "The id of the network interface."
  value       = azurerm_network_interface.example.*.id
}

output "tags" {
  description = "A mapping of tags which should be assigned to the Resource Group."
  value       = var.tags
}


