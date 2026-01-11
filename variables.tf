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
    - sql_connectivity_update_username
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
    virtual_machine_id               = string
    r_services_enabled               = optional(bool)
    sql_connectivity_port            = optional(number, 1433)
    sql_connectivity_type            = optional(string, "PRIVATE")
    sql_connectivity_update_password = optional(string)
    sql_connectivity_update_username = optional(string)
    sql_license_type                 = optional(string)
    sql_virtual_machine_group_id     = optional(string)
    tags                             = optional(map(string))
    assessment = optional(object({
      enabled         = optional(bool, true)
      run_immediately = optional(bool, false)
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
      adhoc_workloads_optimization_enabled = optional(bool, false)
      collation                            = optional(string, "SQL_Latin1_General_CP1_CI_AS")
      instant_file_initialization_enabled  = optional(bool, false)
      lock_pages_in_memory_enabled         = optional(bool, false)
      max_dop                              = optional(number, 0)
      max_server_memory_mb                 = optional(number, 2147483647)
      min_server_memory_mb                 = optional(number, 0)
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
      system_db_on_data_disk_enabled = optional(bool, false)
      temp_db_settings = optional(object({
        data_file_count        = optional(number, 8)
        data_file_growth_in_mb = optional(number, 512)
        data_file_size_mb      = optional(number, 256)
        default_file_path      = string
        log_file_growth_mb     = optional(number, 512)
        log_file_size_mb       = optional(number, 256)
        luns                   = list(number)
      }))
    }))
    wsfc_domain_credential = optional(object({
      cluster_bootstrap_account_password = string
      cluster_operator_account_password  = string
      sql_service_account_password       = string
    }))
  }))
}

