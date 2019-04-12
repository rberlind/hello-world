terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Cloud-Operations"

    workspaces {
      name = "sec_group_test"
    }
  }
}

