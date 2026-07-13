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
  # --- Unconfirmed validation candidates, derived from azurerm_mssql_virtual_machine's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: virtual_machine_id
  #   source:    [from commonids.ValidateVirtualMachineID] !ok
  # path: virtual_machine_id
  #   source:    [from commonids.ValidateVirtualMachineID] err != nil
  # path: sql_license_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: auto_backup.encryption_password
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: auto_backup.manual_schedule.full_backup_frequency
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: auto_backup.manual_schedule.full_backup_start_hour
  #   condition: value >= 0 && value <= 23
  #   message:   must be between 0 and 23
  # path: auto_backup.manual_schedule.full_backup_window_in_hours
  #   condition: value >= 1 && value <= 23
  #   message:   must be between 1 and 23
  # path: auto_backup.manual_schedule.log_backup_frequency_in_minutes
  #   condition: value >= 5 && value <= 60
  #   message:   must be between 5 and 60
  # path: auto_backup.manual_schedule.days_of_week[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: auto_backup.retention_period_in_days
  #   condition: value >= 1 && value <= 30
  #   message:   must be between 1 and 30
  # path: auto_backup.storage_blob_endpoint
  #   source:    validation.IsURLWithHTTPS(...) - no translation rule yet, add one
  # path: auto_backup.storage_account_access_key
  #   source:    validation.StringIsBase64(...) - no translation rule yet, add one
  # path: auto_patching.day_of_week
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: auto_patching.maintenance_window_duration_in_minutes
  #   condition: value >= 30 && value <= 180
  #   message:   must be between 30 and 180
  # path: auto_patching.maintenance_window_starting_hour
  #   condition: value >= 0 && value <= 23
  #   message:   must be between 0 and 23
  # path: assessment.schedule.weekly_interval
  #   condition: value >= 1 && value <= 6
  #   message:   must be between 1 and 6
  # path: assessment.schedule.monthly_occurrence
  #   condition: value >= 1 && value <= 5
  #   message:   must be between 1 and 5
  # path: assessment.schedule.day_of_week
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: assessment.schedule.start_time
  #   condition: can(regex("^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$", value))
  #   message:   duration must match the format HH:mm
  # path: key_vault_credential.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: key_vault_credential.key_vault_url
  #   source:    validation.IsURLWithHTTPS(...) - no translation rule yet, add one
  # path: key_vault_credential.service_principal_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: key_vault_credential.service_principal_secret
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sql_connectivity_port
  #   condition: value >= 1024 && value <= 65535
  #   message:   must be between 1024 and 65535
  # path: sql_connectivity_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: sql_connectivity_update_password
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sql_connectivity_update_username
  #   source:    [from validate.SqlVirtualMachineLoginUserName] !ok
  # path: sql_connectivity_update_username
  #   source:    [from validate.SqlVirtualMachineLoginUserName] !regexp.MustCompile(`^[^\\/"\[\]:|<>+=;,?* .]{2,128}$`).MatchString(v)
  # path: sql_instance.collation
  #   source:    validate.DatabaseCollation: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: sql_instance.max_dop
  #   condition: value >= 0 && value <= 32767
  #   message:   must be between 0 and 32767
  # path: sql_instance.max_server_memory_mb
  #   source:    validation.IntBetween(128, math.MaxInt32) - bound(s) not a literal int (e.g. a named constant like math.MaxInt32) - resolve manually
  # path: sql_instance.min_server_memory_mb
  #   source:    validation.IntBetween(0, math.MaxInt32) - bound(s) not a literal int (e.g. a named constant like math.MaxInt32) - resolve manually
  # path: storage_configuration.disk_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: storage_configuration.storage_workload_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: storage_configuration.data_settings.default_file_path
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: storage_configuration.log_settings.default_file_path
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: storage_configuration.temp_db_settings.default_file_path
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sql_virtual_machine_group_id
  #   source:    [from sqlvirtualmachinegroups.ValidateSqlVirtualMachineGroupID] !ok
  # path: sql_virtual_machine_group_id
  #   source:    [from sqlvirtualmachinegroups.ValidateSqlVirtualMachineGroupID] err != nil
  # path: wsfc_domain_credential.cluster_bootstrap_account_password
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: wsfc_domain_credential.cluster_operator_account_password
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: wsfc_domain_credential.sql_service_account_password
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

