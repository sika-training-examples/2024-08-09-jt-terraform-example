output "eventhub_namespace_id" {
  value = azurerm_eventhub_namespace.this.id
}

output "eventhub_ids" {
  value = { for k, v in azurerm_eventhub.this : k => v.id }
}
