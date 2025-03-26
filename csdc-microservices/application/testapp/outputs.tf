output "instances" {
    value = aws_elastic_beanstalk_environment.app_env.instances
}

output "ebs_env_id" {
    value = aws_elastic_beanstalk_environment.app_env.id
  
}