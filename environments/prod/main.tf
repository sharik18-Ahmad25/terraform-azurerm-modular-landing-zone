module "rg" {
    source = "../../child_modules/azurerm_resource_group"
    rgs = var.prod_rgsrk
  
}

module "vnets_prod" {
    depends_on = [ module.rg ]
  source = "../../child_modules/azurerm_virtual_network"
  vnets = var.prod_vnets
}

module "subnet" {
    depends_on = [ module.vnets_prod ]
    source = "../../child_modules/azurerm_subnet"
    subnets = var.prod_subnets
  
}

module "prd_pip" {
    depends_on = [ module.rg ]
  source = "../../child_modules/azurerm_public_ip"
  pip_name = var.prod_pip
}