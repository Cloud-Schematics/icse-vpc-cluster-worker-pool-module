##############################################################################
# Create Worker Pool
##############################################################################

resource "ibm_container_vpc_worker_pool" "pool" {
  vpc_id            = var.vpc_id
  resource_group_id = var.resource_group_id
  entitlement       = var.entitlement
  cluster           = var.cluster_id
  worker_pool_name  = "${var.prefix}-${var.pool_name}"
  flavor            = var.flavor
  worker_count      = var.workers_per_zone
  crk               = var.encryption_key_id
  kms_instance_id   = var.kms_instance_guid

  dynamic "zones" {
    for_each = var.subnet_zone_list
    content {
      subnet_id = zones.value.id
      name      = zones.value.zone
    }
  }
}

##############################################################################