output "key_vaults" {
  description = "All key_vault resources"
  value       = azurerm_key_vault.key_vaults
}
output "key_vaults_access_policy" {
  description = "List of access_policy values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.access_policy]
}
output "key_vaults_contact" {
  description = "List of contact values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.contact]
}
output "key_vaults_enable_rbac_authorization" {
  description = "List of enable_rbac_authorization values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.enable_rbac_authorization]
}
output "key_vaults_enabled_for_deployment" {
  description = "List of enabled_for_deployment values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.enabled_for_deployment]
}
output "key_vaults_enabled_for_disk_encryption" {
  description = "List of enabled_for_disk_encryption values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.enabled_for_disk_encryption]
}
output "key_vaults_enabled_for_template_deployment" {
  description = "List of enabled_for_template_deployment values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.enabled_for_template_deployment]
}
output "key_vaults_location" {
  description = "List of location values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.location]
}
output "key_vaults_name" {
  description = "List of name values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.name]
}
output "key_vaults_network_acls" {
  description = "List of network_acls values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.network_acls]
}
output "key_vaults_public_network_access_enabled" {
  description = "List of public_network_access_enabled values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.public_network_access_enabled]
}
output "key_vaults_purge_protection_enabled" {
  description = "List of purge_protection_enabled values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.purge_protection_enabled]
}
output "key_vaults_rbac_authorization_enabled" {
  description = "List of rbac_authorization_enabled values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.rbac_authorization_enabled]
}
output "key_vaults_resource_group_name" {
  description = "List of resource_group_name values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.resource_group_name]
}
output "key_vaults_sku_name" {
  description = "List of sku_name values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.sku_name]
}
output "key_vaults_soft_delete_retention_days" {
  description = "List of soft_delete_retention_days values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.soft_delete_retention_days]
}
output "key_vaults_tags" {
  description = "List of tags values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.tags]
}
output "key_vaults_tenant_id" {
  description = "List of tenant_id values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.tenant_id]
}
output "key_vaults_vault_uri" {
  description = "List of vault_uri values across all key_vaults"
  value       = [for k, v in azurerm_key_vault.key_vaults : v.vault_uri]
}

