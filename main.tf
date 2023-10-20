terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  } 
  # backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "robertzebrowskidevops"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  # }
  cloud {
      organization = "robertzebrowskidevops"
      workspaces {
        name = "terra-house-1"
   }
  }
}

provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token     = var.terratowns_access_token
}


module "home_arcanum_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid           = var.teacherseat_user_uuid
  public_path = var.arcanum.public_path
  content_version = var.arcanum.content_version
}


resource "terratowns_home" "home" {
  name = "The best submarine games on PC 2023"
  description = <<DESCRIPTION
What are the best submarine games on PC? 
Submarine simulator games were reasonably popular back in the 90s, 
but if you are looking for new submarine games, your options are much more limited. 
If you are willing to go through all the hassle of making some of those 90s classics like Silent Hunter, 
Silent Service, and Aces of the Deep run on a modern PC, then power to you. However, 
if you are looking for more modern PC games with submarines, this list boasts plenty of solid sub battlers.
DESCRIPTION
  domain_name = module.home_arcanum_hosting.domain_name
  town = "gamers-grotto"
  content_version = var.arcanum.content_version
}
module "home_payday_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.payday.public_path
  content_version = var.payday.content_version
}

resource "terratowns_home" "home_payday" {
  name = "Making your own CBD Brownies"
  description = <<DESCRIPTION
Since I really like Payday candy bars but they cost so much to import
into Canada, I decided I would see how I could make my own CBD brownies, 
with an online recipe.

DESCRIPTION
  domain_name = module.home_payday_hosting.domain_name
  town = "cooker-cove"
  content_version = var.payday.content_version
}




  





