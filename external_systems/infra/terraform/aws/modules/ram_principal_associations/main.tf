resource "aws_ram_principal_association" "ram_pa" {
  principal          = var.principal
  resource_share_arn = var.resource_share_arn

  # The invitation sometime takes a few seconds to propagate
  # provisioner "local-exec" {
  #   command = "python -c 'import time; time.sleep(10)'"
  # }
}