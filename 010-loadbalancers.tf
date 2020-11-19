# Create loadbalancer
resource "openstack_lb_loadbalancer_v2" "lb" {
  name          = var.name
  vip_subnet_id = var.subnet_id
  security_group_ids = var.security_group_ids
  admin_state_up = var.admin_state_up
  vip_address = var.vip_address
  description = var.description
}

module "listeners" {
  source  = "app.terraform.io/Seedbox/listeners/openstack"
  version = "1.0.1"
  count = length(var.listeners)

  name = var.listeners[count.index].name
  protocol = var.listeners[count.index].protocol
  port = var.listeners[count.index].port
  lb_id = openstack_lb_loadbalancer_v2.lb.id
  pools = var.listeners[count.index].pools
}