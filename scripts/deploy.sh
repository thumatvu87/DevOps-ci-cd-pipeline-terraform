
#!/bin/bash
docker pull thumatvu87/devops-app:latest
docker stop app || true
docker rm app || true
docker run -d --name app -p 80:80 thumatvu87/devops-app:latest
