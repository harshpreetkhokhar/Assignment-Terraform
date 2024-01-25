resource "local_file" "current_user" {
  filename = "${path.module}/current-user.txt"
  content =<<-EOT
  current user name: ${var.current_user}
  current user id: ${random_id.current_user-id[0].hex}
  current user password:${sensitive(random_password.current-user-password.result)}
  current user type:${var.user-type}
  Is current user a localite?:${var.local-residence}
  phone number :${var.phone_number}
  EOT
}


resource "local_file" "all-user" {
  filename="${path.module}/../folder2/all-user.txt"
  content=<<-EOT
  CONTENTS OF ALL USERS
  "\n"
   ${join("\n", [for i, user in var.all-user : "ID: ${random_id.current_user-id[i].hex}, Name: ${user.name}, localite: ${user.localite} , User-Type: ${user.user-type}, Phone-Number:${user.phone_number}"])}
    EOT
}



resource "local_file" "file3" {
  filename="${path.module}/../f2/folder3/file1.txt"
  content =<<-EOT
  OWNER DETAILS
  
  ${join("\n",["name: ${var.owner.name},age: ${var.owner.age}, phone_number:${var.owner.phone-number}, location:${var.owner.location}"])}
  -------------------
   INVESTOR DETAILS 
  -------------------
  ${join("\n",[for i in var.investor:" investor: ${i}"])}
   EOT  
  }



resource "random_id" "current_user-id" {
  count = length(var.all-user)+local.increment
  byte_length =local.byte_length
}

resource "random_password" "current-user-password" {
  length = local.max_len
  special= true
}


locals {
  max_len=10
  byte_length=2
  increment=1
  designation="intern"
}
