###############################################################################
#                            LANDING ZONE STRUKTUR                            #
###############################################################################
# Modul für CAF Enterprise Scale, welches die grundlegende Management-
# und Governance-Struktur aufbaut.

module "enterprise_scale" {
  # Nutzung des offiziellen Moduls von Microsoft/Azure
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "~> 5.0"

  # Weitergabe des Providers an das Modul
  providers = {
    azurerm              = azurerm
    azurerm.management   = azurerm
    azurerm.connectivity = azurerm
  }

  # Definition des Wurzel-Management-Groups: TenantID als übergeordnetes Element
  root_parent_id   = data.azurerm_client_config.current.tenant_id
  root_id          = var.root_id
  root_name        = var.root_name
  default_location = var.location

  # Aktivierung des Deployments der Management-Ressourcen (z.B. Log-Analytics, Sentinel)
  deploy_management_resources = true
  subscription_id_management  = data.azurerm_client_config.current.subscription_id

  # Konfiguration der Management-Ressourcen (Log Analytics, Sentinel, etc.)
  configure_management_resources = {
    settings = {
      log_analytics = {
        enabled = true
        config = {
          # Ursprünglich 30 Tage, hier auf 90 Tage angehoben (siehe Architekturentscheidung 4.1)
          retention_in_days = 90
          enable_sentinel   = true
        }
      }
    }
    location = var.location
    tags = {
      environment  = "production"
      purpose      = "management"
      belongs_to   = "sentinel_management" # Tag zur eindeutigen Zuordnung
    }
    advanced = {}
  }
}
