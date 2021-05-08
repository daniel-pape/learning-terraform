# How to run

```bash
terraform init
terraform plan -out=milestone-1.tfplan
terraform apply milestone-1.tfplan
# Confirms that we do not have a current state:
terraform show
```
Code is based on Chapter 1 from "Terraform in Action" by Manning.
