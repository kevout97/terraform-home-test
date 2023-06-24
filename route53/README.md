# Route53

This directory contains the minimum code to setup a new Route53 in AWS.

After apply the code, you should be able to see the next resources:

* Route53 zone
* Route53 record

## Prerequisites

* Terraform >= 1.5.1
* Access to AWS

## Steps

> Before starting with the implementation be sure to have access to the target AWS account.


1. Create a new workspace. Is very recommended to use another workspace instead of the default one.

```
terraform workspace new local
```

2. Initialize the project.

```
terraform init
```

3. Get the especulative plan to verify the resources creation. Don't forget to update the `local.tfvars` to override the default values.

```
terraform plan -var-file=local.tfvars
```

4. Apply your infrastructure
```
terraform apply -var-file=local.tfvars
```

_For testing purposes this project uses the local state, however for shared environments is strnogly recommended to use another backend like Terraform Cloud, or the S3 bucket approach_