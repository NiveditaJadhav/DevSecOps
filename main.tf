# Specify the Docker provider
provider "docker" {}

# Resource to pull the Docker image
resource "docker_image" "app" {
  name = "flask-mysql-docker-app:latest"
}

# Resource to create and manage the Docker container
resource "docker_container" "app_container" {
  name  = "app_container"
  image = docker_image.app.latest

  # Optional: Configure ports and environment variables if needed
  ports {
    internal = 5000
    external = 5000
  }

  # Optional: Example of setting environment variables
  env = [
    "FLASK_ENV=production",
    "MYSQL_DATABASE=mydb"
  ]
}
