<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_public_ip.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compute_count"></a> [compute\_count](#input\_compute\_count) | n/a | `number` | `2` | no |
| <a name="input_ip_config_name"></a> [ip\_config\_name](#input\_ip\_config\_name) | The name of the ip confuguration of the network interface | `string` | `"computeipconfig"` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the Resource Group should exist. | `string` | `"East US2"` | no |
| <a name="input_network_interface_name"></a> [network\_interface\_name](#input\_network\_interface\_name) | The address prefixes to use for the subnet. | `string` | `"compute-nic"` | no |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | The name of the Public IP. | `string` | `"compute-pip"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name which should be used for this Resource Group | `string` | `"func-compute-rg"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The address prefixes to use for the each subnet. | `map(any)` | <pre>{<br>  "private_subnet": [<br>    "10.0.1.0/24"<br>  ],<br>  "public_subnet": [<br>    "10.0.2.0/24"<br>  ]<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the Resource Group. | `map(string)` | <pre>{<br>  "environment": "Development"<br>}</pre> | no |
| <a name="input_virtual_machine_name"></a> [virtual\_machine\_name](#input\_virtual\_machine\_name) | The name of the virtual machine | `string` | `"compute-machine"` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | The name of the virtual machine | `string` | `"func-compute-vnet"` | no |
| <a name="input_vnet_cidr_space"></a> [vnet\_cidr\_space](#input\_vnet\_cidr\_space) | The address space that is used by the virtual network. | `list(string)` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->