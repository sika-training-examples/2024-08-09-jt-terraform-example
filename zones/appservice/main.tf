module "hello_jt_dev" {
  source = "../../modules/hello_jt"

  env = "dev"
}

module "hello_jt_test" {
  source = "../../modules/hello_jt"

  env = "test"
}

///////////////////////////

module "rgs" {
  source = "../../modules/rg"

  for_each = toset(["stage", "prod"])

  name = each.key
}

module "hello_jt_stage" {
  source = "../../modules/hello_jt_v2"

  env                 = "stage"
  resource_group_name = module.rgs["stage"].name
  location            = module.rgs["stage"].location
}

module "hello_jt_prod" {
  source = "../../modules/hello_jt_v2"

  env                 = "prod"
  resource_group_name = module.rgs["prod"].name
  location            = module.rgs["prod"].location
}
