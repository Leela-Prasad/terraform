variable "vpc_id" {
  type = string
}

variable "subnet_id_1" {
  type = string
}

variable "subnet_id_2" {
  type = string
}

variable "public_subnet_id_1" {
  type = string
}

variable "public_subnet_id_2" {
  type = string
}


### EBS Application
variable "application_name" {
  type = string
}

variable "environment_name" {
  type = string
}

variable "solution_stack_name" {
  type = string
}

variable "ebs_domain_prefix" {
  type = string
}

variable "app_version" {
  type = string
}

variable "app_s3_bucket" {
  type = string
}

variable "app_s3_path" {
  type = string
}

variable "service_role" {
  type = string
}

variable "ec2_instance_profile" {
  type = string
}

# variable "vpc_id" {
#   type = string
# }

variable "subnet_ids" {
  type = string
}

variable "ec2_instance_type" {
  type = string
}

variable "test_key" {
  type = string
}

variable "app_logs_retention_in_days" {
  type = string
}

variable "ebs_health_logs_retention_in_days" {
  type = string
}

variable "associate_public_ip" {
  type = string
}

variable "stream_app_logs" {
  type = string
}

variable "stream_ebs_env_health_logs" {
  type = string
}

variable "managed_platform_updates_enabled" {
  type = string
}

variable "asg_environment_type" {
  type = string
}

variable "maintenance_window_time" {
  type = string
}

variable "platform_update_level" {
  type = string
}

variable "health_reporting_system_type" {
  type = string
}

variable "ec2_key_pair" {
  type = string
}

variable "internal_private_cert_path" {
  type = string
}

variable "internal_public_cert_path" {
  type = string
}

variable "external_private_cert_path" {
  type = string
}

variable "external_public_cert_path" {
  type = string
}

variable "min_instances" {
  type = string
}