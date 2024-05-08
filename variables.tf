variable region {
  description = "region"
  type        = string
}

variable "vpc_cidr" {
  type        = string
  description = "description"
}

variable common_resource_name {
  type = string
  description = "common_resource_name"
}

variable environment {
  description = "environment"
  type        = string
}

variable ses_email_reciever {
  type = string
  description = "description"
}

variable machine_data {
  type        = object({
    type = string,
    public_ip = bool
  })
  description = "description"
}

variable subnets_data {
  type        = list(object({
    name = string,
    cidr = string,
    type = string,
    az = string
  }))
  description = "description"
}
