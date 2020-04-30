# Containerization

Now, let's do it with containers!


# Commands

docker ps

docker

# To create first test image

docker build --tag liveviewtest:0.1 .

docker run --publish 8001:4000 --detach --name lvt liveviewtest:0.1
