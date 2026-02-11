variable "key_vaults" {
  description = <<EOT
Map of key_vaults, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
    - tenant_id
Optional:
    - enable_rbac_authorization
    - enabled_for_deployment
    - enabled_for_disk_encryption
    - enabled_for_template_deployment
    - public_network_access_enabled
    - purge_protection_enabled
    - rbac_authorization_enabled
    - soft_delete_retention_days
    - tags
    - access_policy (block):
        - application_id (optional)
        - certificate_permissions (optional)
        - key_permissions (optional)
        - object_id (required)
        - secret_permissions (optional)
        - storage_permissions (optional)
        - tenant_id (required)
    - contact (block):
        - email (required)
        - name (optional)
        - phone (optional)
    - network_acls (block):
        - bypass (required)
        - default_action (required)
        - ip_rules (optional)
        - virtual_network_subnet_ids (optional)
EOT

  type = map(object({
    location                        = string
    name                            = string
    resource_group_name             = string
    sku_name                        = string
    tenant_id                       = string
    enable_rbac_authorization       = optional(bool)
    enabled_for_deployment          = optional(bool)
    enabled_for_disk_encryption     = optional(bool)
    enabled_for_template_deployment = optional(bool)
    public_network_access_enabled   = optional(bool) # Default: true
    purge_protection_enabled        = optional(bool)
    rbac_authorization_enabled      = optional(bool)
    soft_delete_retention_days      = optional(number) # Default: 90
    tags                            = optional(map(string))
    access_policy = optional(list(object({
      application_id          = optional(string)
      certificate_permissions = optional(list(string))
      key_permissions         = optional(list(string))
      object_id               = string
      secret_permissions      = optional(list(string))
      storage_permissions     = optional(list(string))
      tenant_id               = string
    })))
    contact = optional(object({
      email = string
      name  = optional(string)
      phone = optional(string)
    }))
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
        v.access_policy == null || (length(v.access_policy) <= 1024)
      )
    ])
    error_message = "Each access_policy list must contain at most 1024 items"
  }
}

