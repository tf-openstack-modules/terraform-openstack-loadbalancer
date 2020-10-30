# Create listeners
resource "openstack_lb_listener_v2" "listener" {
  name            = var.name
  protocol        = var.protocol
  protocol_port   = var.port
  loadbalancer_id = var.lb_id
}

module "pools" {
  source = "../pools"
  count = length(var.pools)

  name = var.pools[count.index].name
  protocol = var.pools[count.index].protocol
  lb_method = var.pools[count.index].lb_method
  listener_id = openstack_lb_listener_v2.listener.id
  members = var.pools[count.index].members
}