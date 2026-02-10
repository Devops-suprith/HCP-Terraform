variable "my-object" {
  type = object({
    name = string
    userID = number
  })
}

output "objects" {
  value = var.my-object
}