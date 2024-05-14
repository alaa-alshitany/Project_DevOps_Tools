module "network_module" {
  source            = "./network"
  region            = var.region
  vpc_cidr          = var.vpc_cidr
  common_resource_name = var.common_resource_name
  subnets_data   = var.subnets_data
}