include {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "../../modules/terraform-0.14.11.zip"
}

inputs = {
  environment = "prod"
  world = "Mars"
}
