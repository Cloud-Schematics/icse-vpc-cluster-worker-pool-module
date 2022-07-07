##############################################################################
# Outputs
##############################################################################

output "composed_id" {
  description = "The unique identifier of the worker pool. The ID is composed of <cluster_name_id>/<worker_pool_id>."
  value       = ibm_container_vpc_worker_pool.pool.id
}

output "pool_id" {
  description = "Unique ID for the worker pool"
  value       = ibm_container_vpc_worker_pool.pool.worker_pool_id
}

##############################################################################