variable "name" {
  default = "Walter"
}

resource "null_resource" "test_az" {		
   provisioner "local-exec" {		
     command = "echo 'az'"		
   }		
 }		
 
resource "random_id" "random" {
  keepers {
    uuid = "${uuid()}"
  }
  byte_length = 32
}

output "random" {
  value = "${random_id.random.hex}"
}

output "hello_world" {
  value = "Hello, ${var.name}! Your random number is ${random_id.random.hex}"
}
