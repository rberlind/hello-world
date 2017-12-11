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
    command = "echo 'deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main' | sudo tee /etc/apt/sources.list.d/azure-cli.list"
  }
  provisioner "local-exec" {
    command = "sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893"
  }
  provisioner "local-exec" {
    command = "sudo apt-get -y install apt-transport-https"
  }
  provisioner "local-exec" {
    command = "sudo apt-get update && sudo apt-get -y install azure-cli"
  }
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
