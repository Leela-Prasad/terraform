resource "aws_elastic_beanstalk_application" "app" {
  name = var.application_name
}

resource "aws_elastic_beanstalk_application_version" "app_version" {
  name        = var.app_version
  application = aws_elastic_beanstalk_application.app.name
  bucket      = var.app_s3_bucket
  key         = var.app_s3_path
}

resource "aws_security_group" "eb_sg" {
  name_prefix = "test-terraform-sg"
  description = "Terraform Security Group"

  vpc_id = var.vpc_id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elastic_beanstalk_environment" "app_env" {
  application         = aws_elastic_beanstalk_application.app.name
  name                = var.environment_name
  cname_prefix        = var.ebs_domain_prefix
  solution_stack_name = var.solution_stack_name
  version_label       = aws_elastic_beanstalk_application_version.app_version.name

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = var.service_role
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = var.ec2_instance_profile
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = aws_security_group.eb_sg.id
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "TEST_KEY"
    value     = var.test_key
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    # value     = var.associate_public_ip
    value = "true"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = var.subnet_ids
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = var.asg_environment_type
  }

   setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "2"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerIsShared"
    value     = "true"
  }

  setting {
    namespace = "aws:elbv2:loadbalancer"
    name      = "SharedLoadBalancer"
    value     = var.alb_arn
  }

    setting {
    namespace = "aws:elbv2:listener:8080"
    name      = "Protocol"
    value     = "HTTP"
  }

  setting {
    namespace = "aws:elbv2:listener"
    name      = "InstanceProtocol"
    value     = "HTTP"
  }

  setting {
    namespace = "aws:elbv2:listener"
    name      = "InstancePort"
    value     = "8080"
  }

  setting {
    namespace = "aws:elbv2:listener:8080"
    name      = "ListenerEnabled"
    value     = "true"
  }

  setting {
    namespace = "aws:elbv2:listener:8080"
    name      = "Rules"
    value     = "default"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name = "Port"
    value = "8080"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name = "Protocol"
    value = "HTTP"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name = "HealthCheckPath"
    value = "/logger/actuator/health"
  }

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "StreamLogs"
    value     = var.stream_app_logs
  }

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "RetentionInDays"
    value     = var.app_logs_retention_in_days
  }

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs:health"
    name      = "HealthStreamingEnabled"
    value     = var.stream_ebs_env_health_logs
  }

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs:health"
    name      = "RetentionInDays"
    value     = var.ebs_health_logs_retention_in_days
  }

  setting {
    namespace = "aws:elasticbeanstalk:managedactions"
    name      = "ManagedActionsEnabled"
    value     = var.managed_platform_updates_enabled
  }

  setting {
    namespace = "aws:elasticbeanstalk:managedactions"
    name      = "PreferredStartTime"
    value     = var.maintenance_window_time
  }

  setting {
    namespace = "aws:elasticbeanstalk:managedactions:platformupdate"
    name      = "UpdateLevel"
    value     = var.platform_update_level
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.ec2_instance_type
  }

  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = var.health_reporting_system_type
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = var.ec2_key_pair
  }

}
