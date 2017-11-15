terraform {
  backend "atlas" {
    name = "RogerBerlind/basic-enterprise-backend"
  }
}

variable "name" {
<<<<<<< HEAD
  default = "Walter"
=======
  default = "Peter"
>>>>>>> 30eddfae5d55a2e317a51ce8e8dbb5fffe402f38
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
