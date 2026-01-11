resource "azurerm_key_vault" "key_vaults" {
  for_each = var.key_vaults

  location                        = each.value.location
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  sku_name                        = each.value.sku_name
  tenant_id                       = each.value.tenant_id
  enable_rbac_authorization       = each.value.enable_rbac_authorization
  enabled_for_deployment          = each.value.enabled_for_deployment
  enabled_for_disk_encryption     = each.value.enabled_for_disk_encryption
  enabled_for_template_deployment = each.value.enabled_for_template_deployment
  public_network_access_enabled   = each.value.public_network_access_enabled
  purge_protection_enabled        = each.value.purge_protection_enabled
  rbac_authorization_enabled      = each.value.rbac_authorization_enabled
  soft_delete_retention_days      = each.value.soft_delete_retention_days
  tags                            = each.value.tags

  dynamic "access_policy" {
    for_each = each.value.access_policy != null ? each.value.access_policy : []
    content {
      application_id          = access_policy.value.application_id
      certificate_permissions = access_policy.value.certificate_permissions
      key_permissions         = access_policy.value.key_permissions
      object_id               = access_policy.value.object_id
      secret_permissions      = access_policy.value.secret_permissions
      storage_permissions     = access_policy.value.storage_permissions
      tenant_id               = access_policy.value.tenant_id
    }
  }

  dynamic "contact" {
    for_each = each.value.contact != null ? [each.value.contact] : []
    content {
      email = contact.value.email
      name  = contact.value.name
      phone = contact.value.phone
    }
  }

  dynamic "network_acls" {
    for_each = each.value.network_acls != null ? [each.value.network_acls] : []
    content {
      bypass                     = network_acls.value.bypass
      default_action             = network_acls.value.default_action
      ip_rules                   = network_acls.value.ip_rules
      virtual_network_subnet_ids = network_acls.value.virtual_network_subnet_ids
    }
  }
}

