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
    contact = optional(list(object({
      email = string
      name  = optional(string)
      phone = optional(string)
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
        v.access_policy == null || (length(v.access_policy) <= 1024)
      )
    ])
    error_message = "Each access_policy list must contain at most 1024 items"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_key_vault's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.VaultName] !matched
  # path: name
  #   source:    [from validate.VaultName] !matched2
  # path: name
  #   source:    [from validate.VaultName] strings.Contains(value, "--")
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: sku_name
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tenant_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: access_policy.tenant_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: access_policy.object_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: access_policy.application_id
  #   source:    [from validate.IsUUIDOrEmpty] !ok
  # path: access_policy.application_id
  #   source:    [from validate.IsUUIDOrEmpty] err != nil
  # path: network_acls.default_action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: network_acls.bypass
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: network_acls.ip_rules[*]
  #   source:    validation.Any(...) - no translation rule yet, add one
  # path: soft_delete_retention_days
  #   condition: value >= 7 && value <= 90
  #   message:   must be between 7 and 90
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

