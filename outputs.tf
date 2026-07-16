output "mssql_virtual_machines_id" {
  description = "Map of id values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.id if v.id != null && length(v.id) > 0 }
}
output "mssql_virtual_machines_assessment" {
  description = "Map of assessment values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.assessment if v.assessment != null && length(v.assessment) > 0 }
}
output "mssql_virtual_machines_auto_backup" {
  description = "Map of auto_backup values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.auto_backup if v.auto_backup != null && length(v.auto_backup) > 0 }
  sensitive   = true
}
output "mssql_virtual_machines_auto_patching" {
  description = "Map of auto_patching values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.auto_patching if v.auto_patching != null && length(v.auto_patching) > 0 }
}
output "mssql_virtual_machines_key_vault_credential" {
  description = "Map of key_vault_credential values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.key_vault_credential if v.key_vault_credential != null && length(v.key_vault_credential) > 0 }
  sensitive   = true
}
output "mssql_virtual_machines_r_services_enabled" {
  description = "Map of r_services_enabled values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.r_services_enabled if v.r_services_enabled != null }
}
output "mssql_virtual_machines_sql_connectivity_port" {
  description = "Map of sql_connectivity_port values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.sql_connectivity_port if v.sql_connectivity_port != null }
}
output "mssql_virtual_machines_sql_connectivity_type" {
  description = "Map of sql_connectivity_type values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.sql_connectivity_type if v.sql_connectivity_type != null && length(v.sql_connectivity_type) > 0 }
}
output "mssql_virtual_machines_sql_connectivity_update_password" {
  description = "Map of sql_connectivity_update_password values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.sql_connectivity_update_password if v.sql_connectivity_update_password != null && length(v.sql_connectivity_update_password) > 0 }
  sensitive   = true
}
output "mssql_virtual_machines_sql_connectivity_update_username" {
  description = "Map of sql_connectivity_update_username values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.sql_connectivity_update_username if v.sql_connectivity_update_username != null && length(v.sql_connectivity_update_username) > 0 }
  sensitive   = true
}
output "mssql_virtual_machines_sql_instance" {
  description = "Map of sql_instance values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.sql_instance if v.sql_instance != null && length(v.sql_instance) > 0 }
}
output "mssql_virtual_machines_sql_license_type" {
  description = "Map of sql_license_type values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.sql_license_type if v.sql_license_type != null && length(v.sql_license_type) > 0 }
}
output "mssql_virtual_machines_sql_virtual_machine_group_id" {
  description = "Map of sql_virtual_machine_group_id values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.sql_virtual_machine_group_id if v.sql_virtual_machine_group_id != null && length(v.sql_virtual_machine_group_id) > 0 }
}
output "mssql_virtual_machines_storage_configuration" {
  description = "Map of storage_configuration values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.storage_configuration if v.storage_configuration != null && length(v.storage_configuration) > 0 }
}
output "mssql_virtual_machines_tags" {
  description = "Map of tags values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "mssql_virtual_machines_virtual_machine_id" {
  description = "Map of virtual_machine_id values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.virtual_machine_id if v.virtual_machine_id != null && length(v.virtual_machine_id) > 0 }
}
output "mssql_virtual_machines_wsfc_domain_credential" {
  description = "Map of wsfc_domain_credential values across all mssql_virtual_machines, keyed the same as var.mssql_virtual_machines"
  value       = { for k, v in azurerm_mssql_virtual_machine.mssql_virtual_machines : k => v.wsfc_domain_credential if v.wsfc_domain_credential != null && length(v.wsfc_domain_credential) > 0 }
  sensitive   = true
}

