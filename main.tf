provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tf_train" {
  name     = "tf-main-rg"
  location = "Central US"
}

resource "azurerm_container_group" "tfcg_train" {
  name                = "weatherapi"
  location            = azurerm_resource_group.tf_train.location
  resource_group_name = azurerm_resource_group.tf_train.name

  ip_address_type = "public"
  dns_name_label  = "lchinea_wapitf"
  os_type         = "Linux"

  container {
    name   = "weatherapi"
    image  = "lchinea/weatherapi"
    cpu    = "1"
    memory = "1"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}