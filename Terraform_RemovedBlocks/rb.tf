/*
resource "local_file" "foo" {
  content = "Hello Vineesha Chinthala"
  filename = "${path.module}/foo.txt"
}
*/

removed {
  from = local_file.foo
  lifecycle {
    destroy = false
  }
}