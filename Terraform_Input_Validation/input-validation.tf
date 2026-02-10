variable "databaseexample" {
  type = string
  description = "database password"

  validation {
    condition = length(var.databaseexample) >= 12
    error_message = "Please enter password greater than equal to 12"
  }
}