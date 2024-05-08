variable vpc_cidr {
type=string
description = "cidr_var"
}

variable region {
  type = string
  description = "region"
}

variable common_resource_name {
  type = string
  description = "common_resource_name"
}

variable subnets_data {
  type        = list(object({
    name = string,
    cidr = string,
    type = string,
    az = string
  }))
  description = "subnets_data"
}
