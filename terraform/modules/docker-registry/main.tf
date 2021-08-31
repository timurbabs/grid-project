variable "RegistryName" {
}

resource "aws_ecr_repository" "Registry" {
  name                 = var.RegistryName
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
