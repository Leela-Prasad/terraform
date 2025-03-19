terraform {
  backend "s3" {
    bucket         = "terraform-learning-state-bucket01"
    key            = "springbootapp"
    region         = "ap-south-1"
    dynamodb_table = "forms-terraform-state-locking"
  }
}
