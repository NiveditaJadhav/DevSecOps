terraform {
  required_version = ">= 1.6.0"
}

provider "null" {}

resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo Terraform is working!"
  }
}
