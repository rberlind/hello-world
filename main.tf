terraform {
  /*backend "atlas" {
    name = "RogerBerlind/basic-enterprise-backend"
  }*/
}

variable "name" {
  default = "Walter"
}

resource "null_resource" "test_az" {
  provisioner "local-exec" {
    command = "az"
  }
}

resource "random_id" "random" {
  keepers {
    uuid = "${uuid()}"
  }
  byte_length = 32
  depends_on = ["null_resource.test_az"]
}

output "random" {
  value = "${random_id.random.hex}"
}

output "hello_world" {
  value = "Hello, ${var.name}"
}
