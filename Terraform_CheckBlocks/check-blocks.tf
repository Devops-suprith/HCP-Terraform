check "testcheck" {
  data "http" "google" {
    url = "https://www.google123.com"
  }

  assert {
    condition = data.http.google.status_code==200
    error_message = "Website is not running please check"
  }
}

resource "local_file" "foo" {
  content = "HI"
  filename = "${path.module}/foo.txt"
}