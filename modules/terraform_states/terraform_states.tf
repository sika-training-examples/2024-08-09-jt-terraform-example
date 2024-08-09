variable "name" {
  type        = string
  description = "The name of the terraform state storage"
}

variable "rg_prefix" {
  type        = string
  description = "Prefix of RG name"
}


resource "azurerm_resource_group" "this" {
  name     = "${var.rg_prefix}-${var.name}"
  location = "westeurope"
}

module "this" {
  source = "../storage"

  name                = var.name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  containers          = ["terraform-states"]
}
