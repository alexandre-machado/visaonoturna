provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "visaonoturna-rg"
  location = "Brazil South"
}

resource "azurerm_service_plan" "plan" {
  name                = "visaonoturna-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Windows"

  # Shared (60 CPU minutes / day) free tier
  sku_name = "F1"
}

resource "azurerm_windows_web_app" "app" {
  name                = "visaonoturna"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    managed_pipeline_mode = "Classic"
    application_stack {
      dotnet_version = "v4.0"
    }
    always_on         = false
    use_32_bit_worker = true
    default_documents = ["index.asp", "default.asp", "index.htm", "default.htm", "iisstart.htm", "index.html", "default.html"]
    virtual_application {
      preload = false
      virtual_path = "/"
      physical_path = "site\\wwwroot"
    }
  }

  zip_deploy_file = "site.zip"

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}
