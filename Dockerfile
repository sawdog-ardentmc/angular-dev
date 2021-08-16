# Dockerfile
FROM debian/bullseye-slim:latest

ARG USER_ID
ARG GROUP_ID

# create node user
RUN addgroup --gid $GROUP_ID node 
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID node

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update --fix-missing && apt-get install -y \
    bash \
    curl 

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -USER node

RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y\
   nodejs 

USER user

RUN mkdir /home/node/app/node_modules 
WORKDIR /home/node/app

#RUN npx -y -p @angular/cli ng new app --strict=true