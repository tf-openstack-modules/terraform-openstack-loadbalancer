variable "name" {
  type=string
}

variable "subnet_id" {
  type=string
}

variable "security_group_ids" {
  type=list(string)
  default=""
}

variable "admin_state_up" {
  type=bool
  default=true
}

variable "vip_address" {
  type=string
  default=""
}

variable "description" {
  type=string
  default=""
}

variable "listeners" {
  type=list(
    object({
      name=string,
      protocol=string,
      port=number,
      pools=list(object({
        name=string,
        protocol=string,
        lb_method=string
        members=list(object({
          address=string,
          protocol_port=number,
          subnet_id=string
        }))
      }))
    })
  )
}