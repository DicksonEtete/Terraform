provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  alias  = "oregon"
  region = "us-west-2"
  default_tags {
    tags = {
      category = "network"
    }
  }
}

provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
  default_tags {
    tags = {
      category = "network"
    }
  }
}

module "vpc_one" {
  source  = "registry.terraform.io/terraform-aws-modules/vpc/aws"
  version = "3.14.4"
  providers = {
    aws = aws.oregon
  }

  name                 = "vpc-one"
  cidr                 = "10.0.0.0/16"
  azs                  = ["us-west-2a", "us-west-2b"]
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets       = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_dns_hostnames = true
}

module "vpc_two" {
  source  = "registry.terraform.io/terraform-aws-modules/vpc/aws"
  version = "3.14.4"
  providers = {
    aws = aws.mumbai
  }

  name                 = "vpc-two"
  cidr                 = "10.1.0.0/16"
  azs                  = ["ap-south-1a", "ap-south-1b"]
  private_subnets      = ["10.1.1.0/24", "10.1.2.0/24"]
  public_subnets       = ["10.1.101.0/24", "10.1.102.0/24"]
  enable_dns_hostnames = true
}

module "vpc-peering-multi-region" {
  source  = "registry.terraform.io/opencloudsource/vpc-peering-multi-region/aws"
  version = "1.0.4"
  providers = {
    aws.requester = aws.oregon
    aws.accepter  = aws.mumbai
  }

  name                      = var.name
  requester_vpc_id          = module.vpc_one.vpc_id
  requester_subnet_ids      = concat(module.vpc_one.private_subnets, module.vpc_one.public_subnets)
  requester_route_table_ids = concat(module.vpc_one.private_route_table_ids, module.vpc_one.public_route_table_ids)
  accepter_vpc_id           = module.vpc_two.vpc_id
  accepter_subnet_ids       = concat(module.vpc_two.private_subnets, module.vpc_two.public_subnets)
  accepter_route_table_ids  = concat(module.vpc_two.private_route_table_ids, module.vpc_two.public_route_table_ids)
}
