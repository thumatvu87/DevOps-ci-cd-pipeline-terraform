
# End-to-End CI/CD Pipeline using Terraform, Jenkins, Docker, and AWS

This project demonstrates how to provision infrastructure with Terraform, deploy an application using Docker, and manage the pipeline using Jenkins. It reflects a real-world CI/CD implementation suitable for enterprise DevOps workflows.

## 📂 Folder Structure
- **terraform/**: Provisions EC2 instance, security groups, and necessary infrastructure
- **jenkins/**: Jenkinsfile defining pipeline stages (checkout, build, test, deploy)
- **docker/**: Dockerfile to containerize a sample app
- **app/**: Sample application source code
- **scripts/**: Shell scripts used during provisioning or deployments
- **docs/**: Logs, architecture diagrams, and Terraform outputs

## 🚀 Pipeline Flow
1. **Terraform** provisions EC2 on AWS with correct security group and IAM roles.
2. Jenkins agent (on EC2) triggers pipeline on code commit.
3. Code is pulled, built into a Docker image, and tested.
4. Docker image is pushed to Docker Hub.
5. Image is deployed on the provisioned EC2 instance.

## 🛠 Tools Used
- Terraform
- Jenkins
- Docker
- AWS EC2
- Shell scripting
- GitHub
