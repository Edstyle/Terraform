###############################################################################
#                               VARIABLEN                                     #
###############################################################################

# ID (Suffix/Prefix) für die Root Management Group, wird für diverse Resourcenamen genutzt
variable "root_id" {
  type    = string
  default = "my-caf"
  description = "Eindeutige ID (bzw. Suffix/Prefix) für die Root Management Group."
}

# Anzeigename für die Root Management Group
variable "root_name" {
  type    = string
  default = "My CAF Landing Zone"
  description = "Anzeigename für die Root Management Group."
}

# Standardregion für die Bereitstellung aller Ressourcen
variable "location" {
  type    = string
  default = "germanywestcentral"
  description = "Standardregion für alle Bereitstellungen."
}
