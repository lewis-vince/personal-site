FROM node:11.3.0-stretch

# RUN sudo groupadd docker

# The base node image sets a very verbose log level.
ENV NPM_CONFIG_LOGLEVEL warn

RUN mkdir -p /usr/local/app

# Create work directory
WORKDIR /usr/local/app

# Copy app source
COPY . /usr/local/app

# # Install dependencies
# RUN npm i

# Build for production.
RUN npm run build

# Install static hosting server
RUN npm install -g serve

# Tell Docker about the port we'll run on.
EXPOSE 8080

# Serve built site
CMD serve -s build -l 8080