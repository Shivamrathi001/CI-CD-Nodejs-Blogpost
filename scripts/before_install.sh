sudo aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin 548893471177.dkr.ecr.us-east-1.amazonaws.com
sudo docker pull 548893471177.dkr.ecr.us-east-1.amazonaws.com/blogpost:latest
sudo docker network create -d bridge mongo-network
