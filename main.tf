terraform {
  backend "http" {
    address = "http://localhost:6061/?type=git&repository=https://github.com/nerney/github-infrastructure&ref=tf-state&state=state.json"
    lock_address = "http://localhost:6061/?type=git&repository=https://github.com/nerney/github-infrastructure&ref=tf-state&state=state.json"
    unlock_address = "http://localhost:6061/?type=git&repository=https://github.com/nerney/github-infrastructure&ref=tf-state&state=state.json"
    username = "user"
    password = "pswd"
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
