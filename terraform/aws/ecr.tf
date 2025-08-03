resource "aws_ecr_repository" "flask_app" {
  name = "flask-app"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Project = "MultiCloud"
    Environment = terraform.workspace
  }
}

output "ecr_repository_url" {
  value = aws_ecr_repository.flask_app.repository_url
}
