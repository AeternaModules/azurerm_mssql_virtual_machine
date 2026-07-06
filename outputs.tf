output "mssql_virtual_machines" {
  description = "All mssql_virtual_machine resources"
  value       = azurerm_mssql_virtual_machine.mssql_virtual_machines
  sensitive   = true
}
output "mssql_virtual_machines_assessment" {
  description = "List of assessment values across all mssql_virtual_machines"
  value       = [for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : v.assessment]
}
output "mssql_virtual_machines_auto_backup" {
  description = "List of auto_backup values across all mssql_virtual_machines"
  value       = [for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : v.auto_backup]
  sensitive   = true
}
output "mssql_virtual_machines_auto_patching" {
  description = "List of auto_patching values across all mssql_virtual_machines"
  value       = [for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : v.auto_patching]
}
output "mssql_virtual_machines_key_vault_credential" {
  description = "List of key_vault_credential values across all mssql_virtual_machines"
  value       = [for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : v.key_vault_credential]
  sensitive   = true
}
output "mssql_virtual_machines_r_services_enabled" {
  description = "List of r_services_enabled values across all mssql_virtual_machines"
  value       = [for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : v.r_services_enabled]
}
output "mssql_virtual_machines_sql_connectivity_port" {
  description = "List of sql_connectivity_port values across all mssql_virtual_machines"
  value       = [for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : v.sql_connectivity_port]
}
output "mssql_virtual_machines_sql_connectivity_type" {
  description = "List of sql_connectivity_type values across all mssql_virtual_machines"
  value       = [for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : v.sql_connectivity_type]
}
output "mssql_virtual_machines_sql_connectivity_update_password" {
  description = "List of sql_connectivity_update_password values across all mssql_virtual_machines"
  value       = [for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : v.sql_connectivity_update_password]
  sensitive   = true
}
output "mssql_virtual_machines_sql_connectivity_update_username" {
  description = "List of sql_connectivity_update_username values across all mssql_virtual_machines"
  value       = [for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : v.sql_connectivity_update_username]
  sensitive   = true
}
output "mssql_virtual_machines_sql_instance" {
  description = "List of sql_instance values across all mssql_virtual_machines"
  value       = [for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : v.sql_instance]
}
output "mssql_virtual_machines_sql_license_type" {
  description = "List of sql_license_type values across all mssql_virtual_machines"
  value       = [for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : v.sql_license_type]
}
output "mssql_virtual_machines_sql_virtual_machine_group_id" {
  description = "List of sql_virtual_machine_group_id values across all mssql_virtual_machines"
  value       = [for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : v.sql_virtual_machine_group_id]
}
output "mssql_virtual_machines_storage_configuration" {
  description = "List of storage_configuration values across all mssql_virtual_machines"
  value       = [for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : v.storage_configuration]
}
output "mssql_virtual_machines_tags" {
  description = "List of tags values across all mssql_virtual_machines"
  value       = [for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : v.tags]
}
output "mssql_virtual_machines_virtual_machine_id" {
  description = "List of virtual_machine_id values across all mssql_virtual_machines"
  value       = [for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : v.virtual_machine_id]
}
output "mssql_virtual_machines_wsfc_domain_credential" {
  description = "List of wsfc_domain_credential values across all mssql_virtual_machines"
  value       = [for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : v.wsfc_domain_credential]
  sensitive   = true
}

