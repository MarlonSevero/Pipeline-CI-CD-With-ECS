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

data "aws_vpc" "main-project-vpc" {
  id = "vpc-00329cf3b203567eb"
}

resource "aws_subnet" "javapp_subnet" {
  vpc_id     = data.aws_vpc.main-project-vpc.id
  cidr_block = "10.0.100.0/24"
  
  //enable_resource_name_dns_a_record_on_launch = true
  // enable_resource_name_dns_aaaa_record_on_launch = true
}