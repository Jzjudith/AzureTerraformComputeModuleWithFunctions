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

output "vnet_cidr_space" {
  description = "The address prefixes to use for the subnet."
  value       = azurerm_virtual_network.example.address_space
}


# output "subnet_id" {
#   description = "IDs of the subnets"
#   value = {
#     for id in keys(var.subnet) : id =>  azurerm_subnet.example.subnet_id
#   }
# }


# output "public_ip_address_id" {
#   description = "The name of the Public IP."
#   value       = element([for ip in azurerm_public_ip.example : ip.id], count.index)
# }

# output "network_interface_id" {
#   description = "The id of the networl interface."
#   value       =  for nic in azurerm_network_interface.example : nic.id
# }


output "tags" {
  description = "A mapping of tags which should be assigned to the Resource Group."
  value       = var.tags
}


