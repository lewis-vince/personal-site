FROM node:11.3.0-stretch

RUN sudo groupadd docker

# The base node image sets a very verbose log level.
ENV NPM_CONFIG_LOGLEVEL warn

# Create work directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json into the image.
COPY package*.json ./

# Build for production.
RUN sudo npm run build

# Copy app source
COPY . .

# Install static hosting server
RUN sudo npm install -g serve

# Tell Docker about the port we'll run on.
EXPOSE 8080

# Serve built site
CMD sudo serve -s build -l 8080