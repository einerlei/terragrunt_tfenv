include {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "../../modules/terraform-1.0.4.zip"
}

inputs = {
  environment = "non-prod"
  world = "Earth"
}

