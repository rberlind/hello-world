terraform {
  backend "remote" {
    hostname = "roger-ptfe.hashidemos.io"
    organization = "RogerBerlind"
    workspaces {
      name = "test-cli"
    }
  }
}

