## Installation
- Install Terraform
- Generate SSH key pair
```
ssh-keygen -t rsa -C "deployer" -P '' -f ssh/deployer
```
- Add your AWS key to file terraform.tfvars
```
access_key = "your_key"
secret_key = "your_secret"
```
- Change the password for HTTP access in **cloud-config/nodes.yml**. Default is test/test.
- terraform apply 
