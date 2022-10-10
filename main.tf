# resource group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# virtual network
resource "azurerm_virtual_network" "example" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = var.vnet_cidr_space
  depends_on = [
    azurerm_resource_group.example
  ]
}

# subnets
resource "azurerm_subnet" "example" {
  for_each             = var.subnets
  name                 = each.key
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = each.value
  depends_on = [
    azurerm_virtual_network.example
  ]
}

# public ip addresses
resource "azurerm_public_ip" "example" {
  count               = var.compute_count
  name                = "${var.public_ip_name}-${count.index}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"
  depends_on = [
    azurerm_resource_group.example
  ]
  tags = var.tags
}

# network interfaces
resource "azurerm_network_interface" "example" {
  count               = var.compute_count
  name                = "${var.network_interface_name}-${count.index}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "${var.ip_config_name}-${count.index}"
    subnet_id                     = element([for subnet in azurerm_subnet.example : subnet.id], count.index)
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id          = element(azurerm_public_ip.example.*.id, count.index)
    public_ip_address_id = element([for ip in azurerm_public_ip.example : ip.id], count.index)
  }
  depends_on = [
    azurerm_public_ip.example
  ]
}

resource "azurerm_linux_virtual_machine" "example" {
  count               = var.compute_count
  name                = "${var.virtual_machine_name}-${count.index}"
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location
  size                = "Standard_B1s"
  admin_username      = "devlab"
  admin_password      = "Password123"
  # network_interface_ids           = [element(azurerm_network_interface.example.*.id, count.index), ]
  network_interface_ids           = [element([for nic in azurerm_network_interface.example : nic.id], count.index), ]
  disable_password_authentication = false


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  depends_on = [
    azurerm_network_interface.example
  ]

}








