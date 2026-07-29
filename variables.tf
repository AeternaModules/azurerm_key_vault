variable "key_vaults" {
  description = <<EOT
Map of key_vaults, attributes below
Required:
    - location
    - name
    - rbac_authorization_enabled
    - resource_group_name
    - sku_name
    - tenant_id
Optional:
    - enabled_for_deployment
    - enabled_for_disk_encryption
    - enabled_for_template_deployment
    - public_network_access_enabled
    - purge_protection_enabled
    - soft_delete_retention_days
    - tags
    - access_policy (block):
        - application_id (optional)
        - certificate_permissions (optional)
        - key_permissions (optional)
        - object_id (optional)
        - secret_permissions (optional)
        - storage_permissions (optional)
        - tenant_id (optional)
    - network_acls (block):
        - bypass (required)
        - default_action (required)
        - ip_rules (optional)
        - virtual_network_subnet_ids (optional)
EOT

  type = map(object({
    location                        = string
    name                            = string
    rbac_authorization_enabled      = bool
    resource_group_name             = string
    sku_name                        = string
    tenant_id                       = string
    enabled_for_deployment          = optional(bool)
    enabled_for_disk_encryption     = optional(bool)
    enabled_for_template_deployment = optional(bool)
    public_network_access_enabled   = optional(bool)
    purge_protection_enabled        = optional(bool)
    soft_delete_retention_days      = optional(number)
    tags                            = optional(map(string))
    access_policy = optional(list(object({
      application_id          = optional(string)
      certificate_permissions = optional(list(string))
      key_permissions         = optional(list(string))
      object_id               = optional(string)
      secret_permissions      = optional(list(string))
      storage_permissions     = optional(list(string))
      tenant_id               = optional(string)
    })))
    network_acls = optional(object({
      bypass                     = string
      default_action             = string
      ip_rules                   = optional(set(string))
      virtual_network_subnet_ids = optional(set(string))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.key_vaults : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.key_vaults : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.key_vaults : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.key_vaults : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.tenant_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.key_vaults : (
        v.access_policy == null || alltrue([for item in v.access_policy : (item.tenant_id == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.tenant_id))))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.key_vaults : (
        v.access_policy == null || alltrue([for item in v.access_policy : (item.object_id == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.object_id))))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.key_vaults : (
        v.soft_delete_retention_days == null || (v.soft_delete_retention_days >= 7 && v.soft_delete_retention_days <= 90)
      )
    ])
    error_message = "must be between 7 and 90"
  }
  validation {
    condition = alltrue([
      for k, v in var.key_vaults : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 18 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

