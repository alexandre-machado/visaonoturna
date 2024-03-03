# visaonoturna
## Use Terraform and Azure CLI Docker image
https://github.com/zenika-open-source/terraform-azure-cli

```pwsh
docker container run -it --rm --mount type=bind,source="$(pwd)",target=/workspace zenika/terraform-azure-cli:latest

terraform plan; terraform apply -auto-approve
```
