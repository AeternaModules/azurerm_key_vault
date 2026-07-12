output "key_vaults_access_policy" {
  description = "Map of access_policy values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.access_policy }
}
output "key_vaults_contact" {
  description = "Map of contact values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.contact }
}
output "key_vaults_enable_rbac_authorization" {
  description = "Map of enable_rbac_authorization values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.enable_rbac_authorization }
}
output "key_vaults_enabled_for_deployment" {
  description = "Map of enabled_for_deployment values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.enabled_for_deployment }
}
output "key_vaults_enabled_for_disk_encryption" {
  description = "Map of enabled_for_disk_encryption values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.enabled_for_disk_encryption }
}
output "key_vaults_enabled_for_template_deployment" {
  description = "Map of enabled_for_template_deployment values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.enabled_for_template_deployment }
}
output "key_vaults_location" {
  description = "Map of location values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.location }
}
output "key_vaults_name" {
  description = "Map of name values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.name }
}
output "key_vaults_network_acls" {
  description = "Map of network_acls values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.network_acls }
}
output "key_vaults_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.public_network_access_enabled }
}
output "key_vaults_purge_protection_enabled" {
  description = "Map of purge_protection_enabled values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.purge_protection_enabled }
}
output "key_vaults_rbac_authorization_enabled" {
  description = "Map of rbac_authorization_enabled values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.rbac_authorization_enabled }
}
output "key_vaults_resource_group_name" {
  description = "Map of resource_group_name values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.resource_group_name }
}
output "key_vaults_sku_name" {
  description = "Map of sku_name values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.sku_name }
}
output "key_vaults_soft_delete_retention_days" {
  description = "Map of soft_delete_retention_days values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.soft_delete_retention_days }
}
output "key_vaults_tags" {
  description = "Map of tags values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.tags }
}
output "key_vaults_tenant_id" {
  description = "Map of tenant_id values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.tenant_id }
}
output "key_vaults_vault_uri" {
  description = "Map of vault_uri values across all key_vaults, keyed the same as var.key_vaults"
  value       = { for k, v in azurerm_key_vault.key_vaults : k => v.vault_uri }
}

