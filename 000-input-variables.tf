variable "lb" {
  type=object({name=string, subnet_id=string, security_group_ids=list(string)})
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
      }))
    })
  )
}