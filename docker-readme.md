# Containerization

Now, let's do it with containers!

# Commands

docker ps

docker

# To create first test image

docker build --tag lvtest0.3 .

docker run -d -it -p 8000:4000 --mount type=bind,source="$(pwd)",target=/app lvtest0.3

# Bash into a container

docker exec -it [CONTAINER NAME] bash

# Run with a bind mount

example of an nginx container:

docker run -d -it --name devetestmount2.0 --mount type=bind,source="$(pwd)",target=/app nginx:latest

bind mounts are for dev only -- for "production" use a volume!

# Docker Cheat Sheet

## Bash In

docker exec -it [CONTAINER ID] bash

## Remove all stopped contianers:

docker rm $(docker ps -a -q)

# Prune dangling images

From failed build commands:

docker image prune

# Prune containers

(1) run with the --rm flag

(2) docker container prune
