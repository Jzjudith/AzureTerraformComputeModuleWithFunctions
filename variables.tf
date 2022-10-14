variable "resource_group_name" {
  type        = string
  description = "The name which should be used for this Resource Group"
  default     = "func-compute-rg"
}

variable "location" {
  type        = string
  description = "The Azure Region where the Resource Group should exist."
  default     = "East US2"
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual machine"
  default     = "func-compute-vnet"
}

variable "vnet_cidr_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = ["10.0.0.0/16"]
}


variable "subnets" {
  type        = map(any)
  description = "The address prefixes to use for the each subnet."
  default = {
    private_subnet = ["10.0.1.0/24"]

    public_subnet = ["10.0.2.0/24"]

  }
}

variable "public_ip_name" {
  type        = string
  description = "The name of the Public IP."
  default     = "compute-pip"
}

variable "compute_count" {
  default = 2
}

variable "network_interface_name" {
  type        = string
  description = "The address prefixes to use for the subnet."
  default     = "compute-nic"
}

variable "ip_config_name" {
  type        = string
  description = "The name of the ip confuguration of the network interface"
  default     = "computeipconfig"
}

variable "virtual_machine_name" {
  type        = string
  description = "The name of the virtual machine"
  default     = "compute-machine"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags which should be assigned to the Resource Group."
  default = {
    environment = "Development"
  }

}






