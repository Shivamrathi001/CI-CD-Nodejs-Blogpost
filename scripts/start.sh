aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 548893471177.dkr.ecr.us-east-1.amazonaws.com
sudo docker pull 548893471177.dkr.ecr.us-east-1.amazonaws.com/blogpost:latest
sudo docker network create -d bridge mongo-network
sudo docker run -d -p 27017:27017 --network mongo-network --name mongodb mongo
sudo docker run -d -p 80:80 --network mongo-network 548893471177.dkr.ecr.us-east-1.amazonaws.com/blogpost:latest
