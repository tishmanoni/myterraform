terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
    region = var.aws_region

}


resource "aws_vpc" "tera-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "prod-vpc"
    }
  
}

resource "aws_subnet" "public-subnet" {
    
    vpc_id = aws_vpc.tera-vpc.id
    cidr_block = var.subnet_prefix
    tags = {
        Name = "pub-vpc"
    }
  
}

