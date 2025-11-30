
# web url for web vms

output "web_urls" {
  value = [
    for i in range(length(aws_instance.web_instance)) :
    format("http://%s", aws_instance.web_instance[i].public_ip)
  ]
}

# alternate method

# output "web_urls" {
#   value = [
#     for inst in aws_instance.web_instance :
#     format("http://%s", inst.public_ip)
#   ]
# }
