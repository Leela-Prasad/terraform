resource "aws_route53_zone" "hosted_zone" {
  name = var.csdc_hosted_zone
}
