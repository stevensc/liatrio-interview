terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Liatrio-demo-cstevens"

    workspaces {
      name = "liatrio-interview"
    }
  }
}