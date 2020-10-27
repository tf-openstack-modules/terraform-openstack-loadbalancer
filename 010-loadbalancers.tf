# Create loadbalancer
resource "openstack_lb_loadbalancer_v2" "lb" {
  name          = var.lb.name
  vip_subnet_id = var.lb.subnet_id
  security_group_ids = var.lb.security_group_ids
}

module "listeners" {
  source = "./listeners"
  count = length(var.listeners)

  name = var.listeners[count.index].name
  protocol = var.listeners[count.index].protocol
  port = var.listeners[count.index].port
  lb_id = openstack_lb_loadbalancer_v2.lb.id
  pools = var.listeners[count.index].pools
}