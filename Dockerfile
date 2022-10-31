# docker network create -d bridge mongo-network
# docker run -d -p 27017:27017 --network mongo-network --name mongodb mongo
# docker run -d -p 80:80 --network mongo-network --name blogpost blogpost

FROM node:alpine
COPY ./ ./
RUN npm install
EXPOSE 80
CMD ["npm", "start"]
