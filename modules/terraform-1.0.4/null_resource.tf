resource "null_resource" "terraform_version" {
  provisioner "local-exec" {
    command = "terraform version"
  }
}

