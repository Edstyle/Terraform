###############################################################################
#                             PROVIDER-KONFIGURATION                          #
###############################################################################
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.91"
    }
  }
}

provider "azurerm" {
  # Aktivieren der notwendigen Features im AzureRM-Provider
  features {}
}
