resource "local_file" "format_test" {
  content  = "Hello we are testing terraform format"
  filename = "${path.module}/format.txt"
}