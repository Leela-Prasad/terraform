resource "aws_acm_certificate" "csdc_cert" {
  private_key      = file(var.private_cert_path)
  certificate_body = file(var.public_cert_path)
  #   certificate_chain = ""

  lifecycle {
    create_before_destroy = true
  }
}
