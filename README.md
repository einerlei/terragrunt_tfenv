# terragrunt_tfenv
This is to test out the compatibility of tfenv when used in terragrunt.

Deployment environments are in `live`. Modules used by deployments are in `modules`.

```
├── README.md
├── live
│   ├── non-prod
│   │   └── terragrunt.hcl
│   ├── prod
│   │   └── terragrunt.hcl
│   └── terragrunt.hcl
└── modules
    ├── terraform-0.14.11
    │   ├── null_resource.tf
    │   ├── output.tf
    │   └── variables.tf
    ├── terraform-0.14.11.zip
    ├── terraform-1.0.4
    │   ├── null_resource.tf
    │   ├── output.tf
    │   └── variables.tf
    └── terraform-1.0.4.zip
```
    
The modules have been compressed to a zip file to mimic downloading it from a remote source, otherwise .terraform-version files are not pulled.

## Usage
Enter the environment, either `prod` or `non-prod` and run terragrunt. 
Terragrunt will download the `module` defined in `terragrunt.hcl`. When applying, one can observe that the terraform version as defined by the relevant modules' `.terraform-version` is used.

```
$ cd live/non-prod
$ terragrunt init
$ terragrunt apply -auto-approve
WARN[0001] No double-slash (//) found in source URL /Users/matthiasbremser/code/terragrunt_tfenv/modules/terraform-1.0.4.zip. Relative paths in downloaded Terraform code may not work. 

Initializing the backend...

Successfully configured the backend "local"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Finding latest version of hashicorp/null...
- Installing hashicorp/null v3.1.0...
- Installed hashicorp/null v3.1.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
WARN[0001] No double-slash (//) found in source URL /Users/matthiasbremser/code/terragrunt_tfenv/modules/terraform-1.0.4.zip. Relative paths in downloaded Terraform code may not work. 

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.terraform_version will be created
  + resource "null_resource" "terraform_version" {
      + id = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + hello = "non-prod Earth!"
null_resource.terraform_version: Creating...
null_resource.terraform_version: Provisioning with 'local-exec'...
null_resource.terraform_version (local-exec): Executing: ["/bin/sh" "-c" "terraform version"]
null_resource.terraform_version (local-exec): Terraform v1.0.4
null_resource.terraform_version (local-exec): on darwin_amd64
null_resource.terraform_version (local-exec): + provider registry.terraform.io/hashicorp/null v3.1.0
null_resource.terraform_version: Creation complete after 1s [id=5136632866673716925]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

hello = "non-prod Earth!"
```
