variable "mssql_virtual_machines" {
  description = <<EOT
Map of mssql_virtual_machines, attributes below
Required:
    - virtual_machine_id
Optional:
    - r_services_enabled
    - sql_connectivity_port
    - sql_connectivity_type
    - sql_connectivity_update_password
    - sql_connectivity_update_password_key_vault_id (alternative to sql_connectivity_update_password - read from Key Vault instead)
    - sql_connectivity_update_password_key_vault_secret_name (alternative to sql_connectivity_update_password - read from Key Vault instead)
    - sql_connectivity_update_username
    - sql_connectivity_update_username_key_vault_id (alternative to sql_connectivity_update_username - read from Key Vault instead)
    - sql_connectivity_update_username_key_vault_secret_name (alternative to sql_connectivity_update_username - read from Key Vault instead)
    - sql_license_type
    - sql_virtual_machine_group_id
    - tags
    - assessment (block):
        - enabled (optional)
        - run_immediately (optional)
        - schedule (optional, block):
            - day_of_week (required)
            - monthly_occurrence (optional)
            - start_time (required)
            - weekly_interval (optional)
    - auto_backup (block):
        - encryption_enabled (optional)
        - encryption_password (optional)
        - manual_schedule (optional, block):
            - days_of_week (optional)
            - full_backup_frequency (required)
            - full_backup_start_hour (required)
            - full_backup_window_in_hours (required)
            - log_backup_frequency_in_minutes (required)
        - retention_period_in_days (required)
        - storage_account_access_key (required)
        - storage_blob_endpoint (required)
        - system_databases_backup_enabled (optional)
    - auto_patching (block):
        - day_of_week (required)
        - maintenance_window_duration_in_minutes (required)
        - maintenance_window_starting_hour (required)
    - key_vault_credential (block):
        - key_vault_url (required)
        - name (required)
        - service_principal_name (required)
        - service_principal_secret (required)
    - sql_instance (block):
        - adhoc_workloads_optimization_enabled (optional)
        - collation (optional)
        - instant_file_initialization_enabled (optional)
        - lock_pages_in_memory_enabled (optional)
        - max_dop (optional)
        - max_server_memory_mb (optional)
        - min_server_memory_mb (optional)
    - storage_configuration (block):
        - data_settings (optional, block):
            - default_file_path (required)
            - luns (required)
        - disk_type (required)
        - log_settings (optional, block):
            - default_file_path (required)
            - luns (required)
        - storage_workload_type (required)
        - system_db_on_data_disk_enabled (optional)
        - temp_db_settings (optional, block):
            - data_file_count (optional)
            - data_file_growth_in_mb (optional)
            - data_file_size_mb (optional)
            - default_file_path (required)
            - log_file_growth_mb (optional)
            - log_file_size_mb (optional)
            - luns (required)
    - wsfc_domain_credential (block):
        - cluster_bootstrap_account_password (required)
        - cluster_operator_account_password (required)
        - sql_service_account_password (required)
EOT

  type = map(object({
    virtual_machine_id                                     = string
    r_services_enabled                                     = optional(bool)
    sql_connectivity_port                                  = optional(number)
    sql_connectivity_type                                  = optional(string)
    sql_connectivity_update_password                       = optional(string)
    sql_connectivity_update_password_key_vault_id          = optional(string)
    sql_connectivity_update_password_key_vault_secret_name = optional(string)
    sql_connectivity_update_username                       = optional(string)
    sql_connectivity_update_username_key_vault_id          = optional(string)
    sql_connectivity_update_username_key_vault_secret_name = optional(string)
    sql_license_type                                       = optional(string)
    sql_virtual_machine_group_id                           = optional(string)
    tags                                                   = optional(map(string))
    assessment = optional(object({
      enabled         = optional(bool)
      run_immediately = optional(bool)
      schedule = optional(object({
        day_of_week        = string
        monthly_occurrence = optional(number)
        start_time         = string
        weekly_interval    = optional(number)
      }))
    }))
    auto_backup = optional(object({
      encryption_enabled  = optional(bool)
      encryption_password = optional(string)
      manual_schedule = optional(object({
        days_of_week                    = optional(set(string))
        full_backup_frequency           = string
        full_backup_start_hour          = number
        full_backup_window_in_hours     = number
        log_backup_frequency_in_minutes = number
      }))
      retention_period_in_days        = number
      storage_account_access_key      = string
      storage_blob_endpoint           = string
      system_databases_backup_enabled = optional(bool)
    }))
    auto_patching = optional(object({
      day_of_week                            = string
      maintenance_window_duration_in_minutes = number
      maintenance_window_starting_hour       = number
    }))
    key_vault_credential = optional(object({
      key_vault_url            = string
      name                     = string
      service_principal_name   = string
      service_principal_secret = string
    }))
    sql_instance = optional(object({
      adhoc_workloads_optimization_enabled = optional(bool)
      collation                            = optional(string)
      instant_file_initialization_enabled  = optional(bool)
      lock_pages_in_memory_enabled         = optional(bool)
      max_dop                              = optional(number)
      max_server_memory_mb                 = optional(number)
      min_server_memory_mb                 = optional(number)
    }))
    storage_configuration = optional(object({
      data_settings = optional(object({
        default_file_path = string
        luns              = list(number)
      }))
      disk_type = string
      log_settings = optional(object({
        default_file_path = string
        luns              = list(number)
      }))
      storage_workload_type          = string
      system_db_on_data_disk_enabled = optional(bool)
      temp_db_settings = optional(object({
        data_file_count        = optional(number)
        data_file_growth_in_mb = optional(number)
        data_file_size_mb      = optional(number)
        default_file_path      = string
        log_file_growth_mb     = optional(number)
        log_file_size_mb       = optional(number)
        luns                   = list(number)
      }))
    }))
    wsfc_domain_credential = optional(object({
      cluster_bootstrap_account_password = string
      cluster_operator_account_password  = string
      sql_service_account_password       = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.auto_backup == null || (v.auto_backup.encryption_password == null || (length(v.auto_backup.encryption_password) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.auto_backup == null || (v.auto_backup.manual_schedule == null || (v.auto_backup.manual_schedule.full_backup_start_hour >= 0 && v.auto_backup.manual_schedule.full_backup_start_hour <= 23))
      )
    ])
    error_message = "must be between 0 and 23"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.auto_backup == null || (v.auto_backup.manual_schedule == null || (v.auto_backup.manual_schedule.full_backup_window_in_hours >= 1 && v.auto_backup.manual_schedule.full_backup_window_in_hours <= 23))
      )
    ])
    error_message = "must be between 1 and 23"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.auto_backup == null || (v.auto_backup.manual_schedule == null || (v.auto_backup.manual_schedule.log_backup_frequency_in_minutes >= 5 && v.auto_backup.manual_schedule.log_backup_frequency_in_minutes <= 60))
      )
    ])
    error_message = "must be between 5 and 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.auto_backup == null || (v.auto_backup.retention_period_in_days >= 1 && v.auto_backup.retention_period_in_days <= 30)
      )
    ])
    error_message = "must be between 1 and 30"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.auto_backup == null || (can(base64decode(v.auto_backup.storage_account_access_key)))
      )
    ])
    error_message = "must be valid base64"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.auto_patching == null || (v.auto_patching.maintenance_window_duration_in_minutes >= 30 && v.auto_patching.maintenance_window_duration_in_minutes <= 180)
      )
    ])
    error_message = "must be between 30 and 180"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.auto_patching == null || (v.auto_patching.maintenance_window_starting_hour >= 0 && v.auto_patching.maintenance_window_starting_hour <= 23)
      )
    ])
    error_message = "must be between 0 and 23"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.assessment == null || (v.assessment.schedule == null || (v.assessment.schedule.weekly_interval == null || (v.assessment.schedule.weekly_interval >= 1 && v.assessment.schedule.weekly_interval <= 6)))
      )
    ])
    error_message = "must be between 1 and 6"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.assessment == null || (v.assessment.schedule == null || (v.assessment.schedule.monthly_occurrence == null || (v.assessment.schedule.monthly_occurrence >= 1 && v.assessment.schedule.monthly_occurrence <= 5)))
      )
    ])
    error_message = "must be between 1 and 5"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.assessment == null || (v.assessment.schedule == null || (can(regex("^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$", v.assessment.schedule.start_time))))
      )
    ])
    error_message = "duration must match the format HH:mm"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.key_vault_credential == null || (length(v.key_vault_credential.name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.key_vault_credential == null || (length(v.key_vault_credential.service_principal_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.key_vault_credential == null || (length(v.key_vault_credential.service_principal_secret) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.sql_connectivity_port == null || (v.sql_connectivity_port >= 1024 && v.sql_connectivity_port <= 65535)
      )
    ])
    error_message = "must be between 1024 and 65535"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.sql_connectivity_update_password == null || (length(v.sql_connectivity_update_password) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.sql_instance == null || (v.sql_instance.max_dop == null || (v.sql_instance.max_dop >= 0 && v.sql_instance.max_dop <= 32767))
      )
    ])
    error_message = "must be between 0 and 32767"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.storage_configuration == null || (v.storage_configuration.data_settings == null || (length(v.storage_configuration.data_settings.default_file_path) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.storage_configuration == null || (v.storage_configuration.log_settings == null || (length(v.storage_configuration.log_settings.default_file_path) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.storage_configuration == null || (v.storage_configuration.temp_db_settings == null || (length(v.storage_configuration.temp_db_settings.default_file_path) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.wsfc_domain_credential == null || (length(v.wsfc_domain_credential.cluster_bootstrap_account_password) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.wsfc_domain_credential == null || (length(v.wsfc_domain_credential.cluster_operator_account_password) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.wsfc_domain_credential == null || (length(v.wsfc_domain_credential.sql_service_account_password) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_virtual_machines : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 22 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

