# base image
FROM node:latest

# make working directory
WORKDIR /srv/app

# install dependencies
RUN mkdir src/
COPY src src/
COPY package.json .
RUN npm install

#Run app
CMD [ "npm", "start" ]