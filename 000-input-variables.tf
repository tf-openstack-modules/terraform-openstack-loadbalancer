variable "name" {
  type=string
  description="Human-readable name for the Loadbalancer. Does not have to be unique."
}

variable "subnet_id" {
  type=string
  description="The subnet on which to allocate the Loadbalancer's address. A tenant can only create Loadbalancers on networks authorized by policy (e.g. networks that belong to them or networks that are shared). Changing this creates a new loadbalancer. It is required to Neutron LBaaS but optional for Octavia"
}

variable "security_group_ids" {
  type=list(string)
  default=""
  description="A list of security group IDs to apply to the loadbalancer. The security groups must be specified by ID and not name (as opposed to how they are configured with the Compute Instance)."
}

variable "admin_state_up" {
  type=bool
  default=true
  description="The administrative state of the Loadbalancer. A valid value is true (UP) or false (DOWN)"
}

variable "vip_address" {
  type=string
  default=""
  description="The ip address of the load balancer. Changing this creates a new loadbalancer."
}

variable "description" {
  type=string
  default=""
  description= "Human-readable description for the Loadbalancer."
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