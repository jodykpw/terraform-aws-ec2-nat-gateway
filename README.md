# AWS VPC with Private, Public Subnets with NAT using Terraform

![image](https://drive.google.com/uc?export=view&id=1uvgOc_6FiNK0jg_5PQPxit3UWub_pUpX)

## Pre-requisite

- Create `private-key` folder
- Copy your AWS EC2 Key pair `terraform-key.pem` in `private-key` folder

## Populating Variables

The values for these variables should be placed into terraform.tfvars. Simply copy terraform.tfvars.example to terraform.tfvars and edit it with the proper values.

## Execute Terraform Commands

terraform init

terraform validate

terraform plan

terraform apply

## Verify via AWS Management Console

Observation:

1) Verify EC2 Instances created
2) Verify VPC
3) Verify Subnets
4) Verify IGW
5) Verify Public Route for Public Subnets
6) Verify no public route for private subnets
7) Verify NAT Gateway and Elastic IP for NAT Gateway
8) Verify NAT Gateway route for Private Subnets
9) Verify no public route or no NAT Gateway route to Database Subnets
10) Verify Tags

## Connect to Bastion EC2 Instance and Test

```t
# Connect to Bastion EC2 Instance from local desktop
ssh -i private-key/terraform-key.pem ec2-user@<PUBLIC_IP_FOR_BASTION_HOST>

# Curl Test for Bastion EC2 Instance to Private EC2 Instances
curl  http://<Private-Instance-1-Private-IP>
curl  http://<Private-Instance-2-Private-IP>

# Connect to Private EC2 Instances from Bastion EC2 Instance
ssh -i /tmp/terraform-key.pem ec2-user@<Private-Instance-1-Private-IP>
cd /var/www/html
ls -lrta
Observation: 
1) Should find index.html
2) Should find app folder
3) Should find app/index.html file
4) Should find app/metadata.html file
```

## Terraform Destroy

terraform destroy

## Clean-Up

rm -rf .terraform*

rm -rf terraform.tfstate*
