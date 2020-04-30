# Dockerfile v 0.0.0
# Not designed for live development, just a test in containerizing the app at all

# Not the latest, but the version on my laptop, and not slim, but a starting point
FROM elixir:1.8.2
USER root

# Unchanged from demo
# WORKDIR /usr/src/app
COPY . .

# starting with deps.get errors out without this:
# Could not find Hex, which is needed to build dependency :phoenix
RUN mix local.hex --force

# get phoenix dependencies
RUN mix deps.get

# TODO: Mix compile now?

# Taken from https://github.com/nodesource/distributions/blob/master/README.md
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get install -y nodejs

# this is dying, can we get a container built up until now and play around?
# RUN cd assets && npm install

EXPOSE 4000
CMD [ "mix", "phx.server" ]

COPY . .
