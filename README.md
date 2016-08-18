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
- Add your AWS key to file cloud-config/nodes.yml. The policy for this role:
```
{
  "Statement": [
    {
      "Action": [
        "ec2:DescribeInstances"
      ],
      "Effect": "Allow",
      "Resource": [
        "*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
```
- Change the password for HTTP access in **cloud-config/nodes.yml**. Default is test/test.
- terraform apply 
