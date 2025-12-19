locals {
  instance_type_by_env = {
    dev  = "t2.micro"
    qa   = "t2.small"
    prod = "t2.medium"
  }

  instances = {
    "web-${terraform.workspace}" = {
      ami           = var.ami_id
      instance_type = local.instance_type_by_env[terraform.workspace]
      key_name      = var.key_name
      tags = {
        Environment = terraform.workspace
        Application = "web"
      }
    }

    "app-${terraform.workspace}" = {
      ami           = var.ami_id
      instance_type = local.instance_type_by_env[terraform.workspace]
      key_name      = var.key_name
      tags = {
        Environment = terraform.workspace
        Application = "app"
      }
    }
  }
}

module "ec2" {
  source    = "./modules/ec2"
  instances = local.instances
}
