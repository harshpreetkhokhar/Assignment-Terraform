variable "current_user" {
  type=string
}

 variable "current-user-id" {
   type=number
 }

variable "user-type" {
  type=string
}
variable "local-residence" {
  type=bool
}
variable "phone_number" {
  type=number
}

variable "all-user" {
  type=list(object({
        name=string
        localite=bool
        user-type=string
        phone_number=number
      }
    )
  )
}

variable "owner" {
  type = map(string)
}

variable "investor" {
  type = list(string)
}

