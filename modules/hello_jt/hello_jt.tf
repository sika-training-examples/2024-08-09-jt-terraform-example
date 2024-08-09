variable "env" {
  type        = string
  description = "Application environment (prod, stage, test, or dev)"
}

variable "worker_count" {
  type        = number
  description = "Number of workers"
  default     = 1
}

module "rg" {
  source = "../rg"
  name   = "hello-jt-${var.env}"
}

resource "azurerm_service_plan" "this" {
  name                = "hello-jt-${var.env}"
  resource_group_name = module.rg.name
  location            = module.rg.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

module "app" {
  source = "../app"

  config = {
    name                = "hello-jt-${var.env}"
    location            = azurerm_service_plan.this.location
    resource_group_name = azurerm_service_plan.this.resource_group_name
    service_plan_id     = azurerm_service_plan.this.id
    docker_image_name   = "sikalabs/hello-world-server"
    docker_registry_url = "https://index.docker.io"
    worker_count        = var.worker_count
    env = {
      PORT = "80"
      TEXT = "Hello J&T (${var.env})"
    }
  }
}
