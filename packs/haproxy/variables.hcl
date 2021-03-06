variable "job_name" {
  description = "The name to use as the job name which overrides using the pack name"
  type        = string
  // If "", the pack name will be used
  default     = ""
}

variable "datacenters" {
  description = "A list of datacenters in the region which are eligible for task placement"
  type        = list(string)
  default     = ["dc1"]
}

variable "instances" {
  description = "Number of LBs instances to be run on entry"
  type        = number
  default     = 1
}

variable "region" {
  description = "The region where the job should be placed"
  type        = string
  default     = "global"
}

variable "version" {
  description = "The haproxy docker image version. For options, see: https://hub.docker.com/_/haproxy"
  type        = string
  default     = "2.4"
}

variable "address" {
  description = "HAproxy custom address"
  type        = string
  default     = "127.0.0.1"
}

variable "http_port" {
  description = "The Nomad client port that routes to the HAProxy. This port will be where you visit your load balanced application"
  type        = number
  default     = 8081
}

variable "ui_port" {
  description = "The port assigned to the HAProxy UI"
  type        = number
  default     = 1936
}

variable "pre_provisioned_slot_count" {
  description = "Backend slots to pre-provision in HAProxy config"
  type        = number
  default     = 10
}

variable "export_port" {
  description = "Stats export port"
  type        = number
  default     = 9101
}

variable "resources" {
  description = "The resource to assign to the HAProxy system task that runs on every client"
  type = object({
    cpu    = number
    memory = number
  })
  default = {
    cpu         = 200,
    memory      = 256
  }
}

variable "consul" {
  description = "The consul service you wish to load balance"
  type = object({
    host  = string
    port  = number
  })
  default = {
    host  = "127.0.0.1",
    port  = 8600
  }
}

variable "monitoring" {
  description = "Time series configuration"
  type = object({
    enabled = bool
    consul  = bool
    cpu     = number
    memory  = number
  })
  default = {
    enabled     = true,
    consul      = true,
    cpu         = 200,
    memory      = 512
  }
}

variable "dataplane" {
  description = "API Dataplane configuration"
  type = object({
    enabled = bool
    host    = string
    port    = string
  })
  default = {
    enabled     = true,
    user        = "admin",
    pass        = "admin",
    host        = "0.0.0.0",
    port        = "5555"
  }
}