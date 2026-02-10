resource "local_file" "test_logs" {
  content = "Foo!"
  filename = "${path.module}/file.txt"
}