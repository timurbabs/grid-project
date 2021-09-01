variable "RegistryName" {
}

resource "aws_kms_key" "PetclinicArtifactKey" {
  description = "domain key"
}

resource "aws_codeartifact_domain" "PetclinicArtifactDomain" {
  domain         = "petclinic-artifact"
  encryption_key = aws_kms_key.PetclinicArtifactKey.arn
}

resource "aws_codeartifact_repository" "ArtifactRegistry" {
  repository = var.RegistryName
  domain     = aws_codeartifact_domain.PetclinicArtifactDomain.domain

  external_connections {
    external_connection_name = "public:maven-central"
  }
}
