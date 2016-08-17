## Installation
1. Install Terraform
2. Generate SSH key pair
```
ssh-keygen -t rsa -C "deployer" -P '' -f ssh/deployer
```
3. Add your AWS key to file terraform.tfvars
```
access_key = "your_key"
secret_key = "your_secret"
```
4. terraform apply
