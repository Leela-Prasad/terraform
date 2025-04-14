vpc_id = "vpc-01624df164089eeca"

# public subnets
public_subnet_id_1 = "subnet-079764aaca35ec7ef"
public_subnet_id_2 = "subnet-0ac16563282b262ec"

# private subnets
subnet_id_1 = "subnet-0d6d17fce15ea79a3"
subnet_id_2 = "subnet-06275476863089ffb"


### EBS Application Variables
application_name = "springbootapp"
environment_name = "springbootapp-dev"

solution_stack_name = "64bit Amazon Linux 2023 v4.4.4 running Corretto 21"
ebs_domain_prefix   = "springbootapp"

app_version   = "1.0.0"
app_s3_bucket = "springboot-microservices-artifacts"
app_s3_path   = "test/test-1.0-SNAPSHOT.jar"

service_role         = "arn:aws:iam::117915829123:role/aws-elasticbeanstalk-service-role"
ec2_instance_profile = "arn:aws:iam::117915829123:instance-profile/aws-elasticbeanstalk-ec2-role"

subnet_ids = "subnet-079764aaca35ec7ef,subnet-0ac16563282b262ec"

ec2_instance_type = "t2.micro"

app_logs_retention_in_days        = "14"
ebs_health_logs_retention_in_days = "5"

associate_public_ip              = "false"
stream_app_logs                  = "true"
stream_ebs_env_health_logs       = "true"
managed_platform_updates_enabled = "true"

# asg_environment_type         = "SingleInstance"
asg_environment_type         = "LoadBalanced"
maintenance_window_time      = "Sat:01:00"
platform_update_level        = "minor"
health_reporting_system_type = "enhanced"
ec2_key_pair                 = "test-key-pair"
min_instances                = "1"

test_key = "TestValue239"

internal_private_cert_path = "./csdc-microservices/common/certs/internal/private_net_key.key"
internal_public_cert_path  = "./csdc-microservices/common/certs/internal/public_net_cert.pem"

external_private_cert_path = "./csdc-microservices/common/certs/external/private_com_key.key"
external_public_cert_path  = "./csdc-microservices/common/certs/external/public_com_cert.pem"
