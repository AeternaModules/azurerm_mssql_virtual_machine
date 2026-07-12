output "mssql_virtual_machines_assessment" {
  description = "Map of assessment values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.assessment }
}
output "mssql_virtual_machines_auto_backup" {
  description = "Map of auto_backup values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.auto_backup }
  sensitive   = true
}
output "mssql_virtual_machines_auto_patching" {
  description = "Map of auto_patching values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.auto_patching }
}
output "mssql_virtual_machines_key_vault_credential" {
  description = "Map of key_vault_credential values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.key_vault_credential }
  sensitive   = true
}
output "mssql_virtual_machines_r_services_enabled" {
  description = "Map of r_services_enabled values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.r_services_enabled }
}
output "mssql_virtual_machines_sql_connectivity_port" {
  description = "Map of sql_connectivity_port values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.sql_connectivity_port }
}
output "mssql_virtual_machines_sql_connectivity_type" {
  description = "Map of sql_connectivity_type values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.sql_connectivity_type }
}
output "mssql_virtual_machines_sql_connectivity_update_password" {
  description = "Map of sql_connectivity_update_password values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.sql_connectivity_update_password }
  sensitive   = true
}
output "mssql_virtual_machines_sql_connectivity_update_username" {
  description = "Map of sql_connectivity_update_username values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.sql_connectivity_update_username }
  sensitive   = true
}
output "mssql_virtual_machines_sql_instance" {
  description = "Map of sql_instance values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.sql_instance }
}
output "mssql_virtual_machines_sql_license_type" {
  description = "Map of sql_license_type values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.sql_license_type }
}
output "mssql_virtual_machines_sql_virtual_machine_group_id" {
  description = "Map of sql_virtual_machine_group_id values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.sql_virtual_machine_group_id }
}
output "mssql_virtual_machines_storage_configuration" {
  description = "Map of storage_configuration values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.storage_configuration }
}
output "mssql_virtual_machines_tags" {
  description = "Map of tags values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.tags }
}
output "mssql_virtual_machines_virtual_machine_id" {
  description = "Map of virtual_machine_id values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.virtual_machine_id }
}
output "mssql_virtual_machines_wsfc_domain_credential" {
  description = "Map of wsfc_domain_credential values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.wsfc_domain_credential }
  sensitive   = true
}

