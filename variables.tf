##############################################################################
# Module Level Variables
##############################################################################

variable "prefix" {
  description = "The prefix that you would like to prepend to your resources"
  type        = string
}

variable "resource_group_id" {
  description = "Resource group ID where the cluster will be provisioned."
  type        = string
  default     = null
}

variable "tags" {
  description = "List of Tags for the resource created"
  type        = list(string)
  default     = null
}

##############################################################################

##############################################################################
# VPC Variables
##############################################################################

variable "vpc_id" {
  description = "ID of the VPC where the cluster will be provisioned"
  type        = string
}

variable "subnet_zone_list" {
  description = "List of subnets in the VPC where gateways and reserved IPs will be provisioned. This value is intended to use the `subnet_zone_list` output from the ICSE VPC Subnet Module (https://github.com/Cloud-Schematics/vpc-subnet-module) or from templates using that module for subnet creation."
  type = list(
    object({
      name = string
      id   = string
      zone = optional(string)
      cidr = optional(string)
    })
  )
}

##############################################################################

##############################################################################
# Cluster Variables
##############################################################################

variable "cluster_id" {
  description = "GUID of Cluster where worker pool will be provisioned"
  type        = string
}

##############################################################################

##############################################################################
# Pool Variables
##############################################################################

variable "pool_name" {
  description = "Worker pool name. (Prefix will be prepended to the beginning of the pool name)"
  type        = string
}

variable "flavor" {
  description = "Machine type for cluster. Use the IBM Cloud CLI command `ibmcloud ks flavors` to find valid machine types"
  type        = string
  default     = "bx2.16x64"
}

variable "workers_per_zone" {
  description = "Number of workers in each zone of the worker pool."
  type        = number
  default     = 2
}

variable "entitlement" {
  description = "If you do not have an entitlement, leave as null. Entitlement reduces additional OCP Licence cost in OpenShift clusters. Use Cloud Pak with OCP Licence entitlement to create the OpenShift cluster. Note It is set only when the first time creation of the cluster, further modifications are not impacted Set this argument to cloud_pak only if you use the cluster with a Cloud Pak that has an OpenShift entitlement."
  type        = string
  default     = null
}

variable "encryption_key_id" {
  description = "OPTIONAL - Encryption key ID for worker pool. Used with `kms_instance_guid`"
  type        = string
  default     = null
}

variable "kms_instance_guid" {
  description = "OPTIONAL - GUID of the KMS instance where `encrption_key` is provisioned. Use with `encryption_key_id`."
  type        = string
  default     = null
}

##############################################################################