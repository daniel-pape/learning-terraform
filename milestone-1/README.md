# How to run

```bash
# Initialises the Terraform working directory and download 
# necessary modules
terraform init
# Create the execution plan and output it the
# file "milestone-1.tfplan":
terraform plan -out=milestone-1.tfplan
# Build/change infrastructure according to the plan:
terraform apply milestone-1.tfplan
# Inspect the state stored in terraform.tfstate:
terraform show
# Destroy the infrastructure managed by Terraform:
terraform destroy
# Confirms that we do not have a current state:
terraform show
```
Code is based on Chapter 1 from "Terraform in Action" by Manning.
