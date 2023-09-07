resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.pk.public_key_openssh
  tags = merge(var.tags, {
    Environment = var.environment
  })
}

resource "aws_ssm_parameter" "private_key" {
  name  = var.key_name
  value = tls_private_key.pk.private_key_pem
  type  = "SecureString"
  tags = merge(var.tags, {
    Environment = var.environment
  })
}