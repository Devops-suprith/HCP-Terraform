terraform { 
  cloud { 
    
    organization = "Terraform_Learning_Suprith_Org" 

    workspaces { 
      name = "CLI-Driven" 
    } 
  } 
}

resource "aws_instance" "suprith_vm" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "t2.micro"

  tags = {
    Name = "Test_EC2_terraform"
  }
}