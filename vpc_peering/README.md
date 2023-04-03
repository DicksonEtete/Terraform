# New VPCs

When you need to create the VPCs and then create a peering connection in the same terraform apply.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform apply -destroy` when you don't need these resources.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.27 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc-peering-multi-region"></a> [vpc-peering-multi-region](#module\_vpc-peering-multi-region) | registry.terraform.io/opencloudsource/vpc-peering-multi-region/aws | 1.0.1 |
| <a name="module_vpc_one"></a> [vpc\_one](#module\_vpc\_one) | registry.terraform.io/terraform-aws-modules/vpc/aws | 3.14.4 |
| <a name="module_vpc_two"></a> [vpc\_two](#module\_vpc\_two) | registry.terraform.io/terraform-aws-modules/vpc/aws | 3.14.4 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->