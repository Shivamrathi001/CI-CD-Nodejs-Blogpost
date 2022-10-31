# sudo docker run -d -p 27017:27017 --network mongo-network --name mongodb mongo
# sudo docker run -d -p 80:80 --network mongo-network 548893471177.dkr.ecr.us-east-1.amazonaws.com/blogpost:latest
sudo docker compose down
sudo docker compose up
