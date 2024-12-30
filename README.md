# tf-cicd
Automating Terraform deployments on Azure using Jenkins

#### terraform init
- This is used to initialize a working directory that contains the Terraform configuration files
- This command will also install any plygins required by the providers.
- This command will also create a dependency lock file.
```
terraform init
```

#### terraform plan
```
terraform plan -out main.tfplan
```
This command is going to create an execution plan
Here you can preview the changes that Terraform is going to carry out
You can specify to save the generated file to disk

#### terraform apply
This command executes the actions within the Terraform plan
```
terraform apply

terraform apply main.tfplan
```

#### terraform destroy
destroy resources