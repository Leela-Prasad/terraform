resource "aws_api_gateway_vpc_link" "vpc_link" {
    name = "csdc-nonprod-vpc-link"
    target_arns = [var.nlb_arn]
}