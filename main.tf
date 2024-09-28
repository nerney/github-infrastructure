terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

variable "token" { type = string }
provider "github" {
  token = var.token
}

resource "github_repository" "repo" {
  name        = "github-infrastructure"
  visibility = "public"
}