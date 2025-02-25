###############################################################################
#                              DATENQUELLEN                                   #
###############################################################################

# Liefert Infos zum aktuell angemeldeten Azure-Client (Tenant-ID, Subscription-ID etc.)
data "azurerm_client_config" "current" {}
