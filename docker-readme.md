# Containerization

Now, let's do it with containers!

# Commands

docker ps

docker

# To create first test image

docker build --tag liveviewtest:0.2 .

docker run --publish 8001:4000 --detach liveviewtest:0.2

# Docker Cheat Sheet

## Bash In

docker exec -it [CONTAINER ID] bash

## Remove all stopped contianers:

docker rm $(docker ps -a -q)
