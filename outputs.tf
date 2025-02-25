###############################################################################
#                                  OUTPUTS                                    #
###############################################################################

# Gibt die ID der Management-Gruppe zurück, die vom Enterprise Scale Modul erstellt wurde
output "management_group_id" {
  description = "ID der Management-Gruppe, die vom Enterprise Scale Modul erstellt wurde."
  value       = module.enterprise_scale.management_group_ids["/providers/Microsoft.Management/managementGroups/${var.root_id}-management"]
}

# Gibt den Namen der Management-RG zurück
output "resource_group_name" {
  description = "Name der Management-Resource-Group"
  value       = azurerm_resource_group.management_rg.name
}

# Gibt die ID des Log Analytics Workspace aus
output "log_analytics_workspace_id" {
  description = "ID des Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.law.id
}

# Zeigt an, dass Sentinel aktiviert wurde
output "sentinel_instance" {
  description = "Zeigt an, dass Sentinel auf dem Log Analytics Workspace aktiviert wurde."
  value       = "Sentinel enabled on ${azurerm_log_analytics_workspace.law.name}"
}
