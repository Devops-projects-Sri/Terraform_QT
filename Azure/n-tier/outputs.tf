# provides web vm ip address for verification 
## uses format function to substitute ip address

output "web-url" {
  value = format("http://%s", azurerm_linux_virtual_machine.web.public_ip_address)
}