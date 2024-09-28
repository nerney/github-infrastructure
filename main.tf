locals {
  state = "http://localhost:6061/?type=git&repository=https://github.com/nerney/github-infrastructure&ref=tf-state&state=state.json"
}

terraform {
  backend "http" {
    address = local.state
    lock_address = local.state
    unlock_address = local.state
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

resource "github_repository" "repo" {
  name        = "github-infrastructure"
  visibility = "public"
}