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
Enter the environment, either `prod` or `non-prod` and run terragrunt:
```
$ cd live/non-prod
$ terragrunt init
$ terragrunt apply -auto-approve
```

Terragrunt will download the `module` defined in `terragrunt.hcl`. When applying, one can observe that the terraform version as defined by the relevant modules' `.terraform-version` is used.
