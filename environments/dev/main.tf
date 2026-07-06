module "rg" {
    source = "../../child_modules/azurerm_resource_group"
    rgs = var.dev_rgsrk
  
}

module "vnets_dev" {
    depends_on = [ module.rg ]
  source = "../../child_modules/azurerm_virtual_network"
  vnets = var.dev_vnets
}

module "subnet" {
    depends_on = [ module.vnets_dev ]
    source = "../../child_modules/azurerm_subnet"
    subnets = var.dev_subnets
  
}

module "dev_pip" {
    depends_on = [ module.rg ]
  source = "../../child_modules/azurerm_public_ip"
  pip_name = var.pip
}