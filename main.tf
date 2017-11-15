terraform {
  backend "atlas" {
    name = "RogerBerlind/basic-enterprise-backend"
  }
}

variable "name" {
  default = "Carol"
}

resource "random_id" "random" {
  keepers {
    uuid = "${uuid()}"
  }
  byte_length = 24
}

output "random" {
  value = "${random_id.random.hex}"
}

output "hello_world" {
  value = "Hello, ${var.name}"
}
