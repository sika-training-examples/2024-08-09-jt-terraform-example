
resource "azurerm_resource_group" "rg" {
  name     = "jt-appservice"
  location = "westeurope"
}

resource "azurerm_service_plan" "main" {
  name                = "jt"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}


module "hello-jt" {
  source = "../../modules/app"

  config = {
    name                = "jt-demo-terraform"
    location            = azurerm_service_plan.main.location
    resource_group_name = azurerm_service_plan.main.resource_group_name
    service_plan_id     = azurerm_service_plan.main.id
    docker_image_name   = "sikalabs/hello-world-server"
    docker_registry_url = "https://index.docker.io"
    worker_count        = 2
    env = {
      PORT = "80"
      TEXT = "Hello J&T"
    }
  }
}
