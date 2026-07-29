output "key_vaults_id" {
  description = "Map of id values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.id if v.id != null && length(v.id) > 0 }
}
output "key_vaults_access_policy" {
  description = "Map of access_policy values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.access_policy if v.access_policy != null && length(v.access_policy) > 0 }
}
output "key_vaults_enabled_for_deployment" {
  description = "Map of enabled_for_deployment values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.enabled_for_deployment if v.enabled_for_deployment != null }
}
output "key_vaults_enabled_for_disk_encryption" {
  description = "Map of enabled_for_disk_encryption values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.enabled_for_disk_encryption if v.enabled_for_disk_encryption != null }
}
output "key_vaults_enabled_for_template_deployment" {
  description = "Map of enabled_for_template_deployment values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.enabled_for_template_deployment if v.enabled_for_template_deployment != null }
}
output "key_vaults_location" {
  description = "Map of location values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.location if v.location != null && length(v.location) > 0 }
}
output "key_vaults_name" {
  description = "Map of name values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.name if v.name != null && length(v.name) > 0 }
}
output "key_vaults_network_acls" {
  description = "Map of network_acls values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.network_acls if v.network_acls != null && length(v.network_acls) > 0 }
}
output "key_vaults_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.public_network_access_enabled if v.public_network_access_enabled != null }
}
output "key_vaults_purge_protection_enabled" {
  description = "Map of purge_protection_enabled values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.purge_protection_enabled if v.purge_protection_enabled != null }
}
output "key_vaults_rbac_authorization_enabled" {
  description = "Map of rbac_authorization_enabled values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.rbac_authorization_enabled if v.rbac_authorization_enabled != null }
}
output "key_vaults_resource_group_name" {
  description = "Map of resource_group_name values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "key_vaults_sku_name" {
  description = "Map of sku_name values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.sku_name if v.sku_name != null && length(v.sku_name) > 0 }
}
output "key_vaults_soft_delete_retention_days" {
  description = "Map of soft_delete_retention_days values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.soft_delete_retention_days if v.soft_delete_retention_days != null }
}
output "key_vaults_tags" {
  description = "Map of tags values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "key_vaults_tenant_id" {
  description = "Map of tenant_id values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.tenant_id if v.tenant_id != null && length(v.tenant_id) > 0 }
}
output "key_vaults_vault_uri" {
  description = "Map of vault_uri values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.vault_uri if v.vault_uri != null && length(v.vault_uri) > 0 }
}

