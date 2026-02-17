# DevOps CI/CD Pipeline with Terraform, Jenkins, and Docker

This project demonstrates a complete DevOps CI/CD pipeline for a Flask application using Terraform, Jenkins, Docker, and AWS.

## Architecture Overview

```
+-------------------+         +-------------------+         +-------------------+
|                   |         |                   |         |                   |
|   Developer PC    +-------->+   GitHub Repo     +-------->+   Jenkins Server  |
|                   |  Push   | (Source Code)     |  Pull   | (on AWS EC2)      |
+-------------------+         +-------------------+         +-------------------+
                                                                  |
                                                                  | Builds Docker Image
                                                                  v
                                                        +-------------------+
                                                        |                   |
                                                        |   DockerHub       |
                                                        | (Image Registry)  |
                                                        +-------------------+
                                                                  |
                                                                  | Pulls Image
                                                                  v
                                                        +-------------------+
                                                        |                   |
                                                        |   EC2 App Server  |
                                                        | (Deployed via     |
                                                        |  Terraform)       |
                                                        +-------------------+
                                                                  |
                                                                  | Runs Container
                                                                  v
                                                        +-------------------+
                                                        |                   |
                                                        |   Flask App       |
                                                        |   (app.py)        |
                                                        +-------------------+
```

## Project Structure

```
.
├── app/                # Flask application code (app.py)
├── docker/             # Dockerfile for building the app image
├── jenkins/            # Jenkinsfile for CI/CD pipeline
├── scripts/            # Deployment scripts (deploy.sh)
└── terraform/          # Terraform IaC (main.tf, variables.tf)
```

## Getting Started

### 1. Infrastructure Setup

- Edit `terraform/variables.tf` to set your AWS region, AMI, instance type, and SSH key.
- Run Terraform to provision resources:
  ```bash
  cd terraform
  terraform init
  terraform apply
  ```

### 2. Jenkins Setup

- Access Jenkins on the provisioned EC2 instance (port 8080).
- Configure credentials for DockerHub in Jenkins.
- Use the provided `jenkins/Jenkinsfile` for your pipeline.

### 3. Build & Deploy

- On code push, Jenkins will:
  - Build and test the Docker image.
  - Push the image to DockerHub.
  - SSH into the app server and run `deploy.sh` to update the running container.

### 4. Access the Application

- The Flask app will be available on the app server’s public IP (port 80).

## Files of Interest

- `app/app.py` - Main Flask application.
- `docker/Dockerfile` - Docker build instructions.
- `jenkins/Jenkinsfile` - Jenkins pipeline definition.
- `scripts/deploy.sh` - Deployment script for the app server.
- `terraform/main.tf` & `terraform/variables.tf` - Infrastructure as Code.

## Requirements

- AWS account and credentials
- Terraform
- Docker
- Jenkins
- Python 3.x

## License

MIT

---

**Author:** Venkata Sai Tirumala Naidu Thumati