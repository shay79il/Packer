# A simple way to check connection to cault 
# and retrive relevant params we need
source "null" "example" {
  communicator = "none"
}

build {
  sources = [
    "source.null.example"
  ]

  provisioner "shell-local" {
    environment_vars = ["API_KEY=${vault("/secret/preprod/vsphere/azdc01", "password")}"]
    command          = "echo API_KEY is $API_KEY"
  }
}
