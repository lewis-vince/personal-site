FROM circleci/node:11.3.0-stretch

RUN sudo groupadd docker

# RUN sudo gpasswd --add $USER docker 
# RUN whoami
# RUN sudo usermod -G docker -a $USER

# The base node image sets a very verbose log level.
ENV NPM_CONFIG_LOGLEVEL warn

# Copy all local files into the image.
COPY . .

# Build for production.
RUN sudo npm run build

# Install static hosting server
RUN npm install -g serve

# Serve built site
RUN serve -s build

# Tell Docker about the port we'll run on.
EXPOSE 5000