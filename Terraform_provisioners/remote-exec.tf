resource "aws_instance" "remote-exec" {
  ami = "ami-0532be01f26a3de55"
  instance_type = "t2.micro"
  key_name = "Terraform-key"
  vpc_security_group_ids = ["sg-0ff83d0a24da171bf"]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("./Terraform-key.pem")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo yum -y install nginx",
        "sudo systemctl start nginx"
    ]
    when = create
    on_failure = fail
  }
}