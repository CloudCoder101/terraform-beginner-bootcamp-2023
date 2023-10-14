terraform {
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "robertzebrowskidevops"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
cloud {
  organization = "robertzebrowskidevops"
  workspaces {
    name = "terra-house-1"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.20.1"
    }
  }
}

provider "aws" {
}
provider "random" {
  # Configuration options
}