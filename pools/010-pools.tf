resource "openstack_lb_pool_v2" "pools" {
  name        = var.name
  protocol    = var.protocol
  lb_method   = var.lb_method
  listener_id = var.listener_id
}