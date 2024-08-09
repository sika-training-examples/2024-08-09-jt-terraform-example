module "hello_jt_dev" {
  source = "../../modules/hello_jt"

  env = "dev"
}

module "hello_jt_test" {
  source = "../../modules/hello_jt"

  env = "test"
}
