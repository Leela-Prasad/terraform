module "csdc_alb" {
    source = "./csdc-microservices/common/alb"
    vpc_id = var.vpc_id
    subnet_id_1 = var.public_subnet_id_1
    subnet_id_2 = var.public_subnet_id_2
    target_id = element(module.test_app.instances, 0)
    # subnet_id_1 = var.subnet_id_1
    # subnet_id_2 = var.subnet_id_2
}

# module "csdc_nlb" {
#     source = "./csdc-microservices/common/nlb"
#     vpc_id = var.vpc_id
#     subnet_id_1 = var.subnet_id_1
#     subnet_id_2 = var.subnet_id_2
#     alb_arn = module.csdc_alb.alb_arn
# }

# module "csdc_vpclink" {
#     source = "./csdc-microservices/common/vpclink"
#     nlb_arn = module.csdc_nlb.nlb_arn
# }

module "test_app" {
    source = "./csdc-microservices/application/testapp"
    application_name                  = var.application_name
   environment_name                  = var.environment_name
   solution_stack_name               = var.solution_stack_name
   ebs_domain_prefix                 = var.ebs_domain_prefix
   app_version                       = var.app_version
   app_s3_bucket                     = var.app_s3_bucket
   app_s3_path                       = var.app_s3_path
   service_role                      = var.service_role
   ec2_instance_profile              = var.ec2_instance_profile
   vpc_id                            = var.vpc_id
   subnet_ids = var.subnet_ids
   ec2_instance_type                 = var.ec2_instance_type
   app_logs_retention_in_days        = var.app_logs_retention_in_days
   ebs_health_logs_retention_in_days = var.ebs_health_logs_retention_in_days
   associate_public_ip               = var.associate_public_ip
   stream_app_logs                   = var.stream_app_logs
   stream_ebs_env_health_logs        = var.stream_ebs_env_health_logs
   managed_platform_updates_enabled  = var.managed_platform_updates_enabled
   asg_environment_type              = var.asg_environment_type
   alb_arn = module.csdc_alb.alb_arn
   maintenance_window_time           = var.maintenance_window_time
   platform_update_level             = var.platform_update_level
   health_reporting_system_type      = var.health_reporting_system_type
   ec2_key_pair                      = var.ec2_key_pair
   test_key                          = var.test_key
}