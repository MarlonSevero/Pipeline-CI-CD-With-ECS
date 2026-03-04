terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

#VPC
data "aws_vpc" "main-project-vpc" {
  id = "vpc-00329cf3b203567eb"
}

#PUBLIC & PRIVATE SUBNETS 
data "aws_subnet" "main-private-subnet-1a" {
  id = "subnet-0dc456abd25a26489"
}

data "aws_subnet" "main-private-subnet-1b" {
  id = "subnet-086ef7f849c584b53"
}

data "aws_subnet" "main-public-subnet-1a" {
  id = "subnet-09d75522d3ba64cc9"
}

data "aws_subnet" "main-public-subnet-1b" {
  id = "subnet-0a5c7cd75c1f390df"
}

