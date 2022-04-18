provider "aws" {
  region = var.region

  default_tags {
    tags = {
      hashicorp-learn = "cloud-run-tasks-snyk"
    }
  }
}

resource "aws_default_security_group" "default" {
  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound from anywhere"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
