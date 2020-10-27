variable "name" {
  type=string
}

variable "protocol" {
  type=string
}

variable "port" {
  type=number
}

variable "lb_id" {
  type=string
}

variable "pools" {
  type=list(object({
    name=string,
    protocol=string,
    lb_method=string
  }))
}