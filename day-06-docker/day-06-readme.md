node docker file ex

FROM node:12.2.0-alpine
WORKDIR app
COPY . /app
RUN npm install
EXPOSE 8000
CMD ["node","app.js"]

docker build -t node-todo .

docker run -d --name node-todo-ctr -p 8000:8000 node-todo:latest  (best practice tag version explicitely like todo:1.0.0 during build)

docker attach <container_id> -> attach terminal with container terminal

Docker volume

docker volume create --name my_new_volume --opt type=none --opt o=bind --opt device=/home/ubuntu/projects/volumes  


Docker Compose
