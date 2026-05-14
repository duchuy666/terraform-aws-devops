module "network" {
  source = "./modules/vpc"
  env_name = "dev-duchuy"
  vpc_cidr = "10.0.0.0/16"
}