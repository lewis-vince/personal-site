FROM circleci/node:11.3.0-stretch

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

USER docker

# The base node image sets a very verbose log level.
ENV NPM_CONFIG_LOGLEVEL warn

# Copy all local files into the image.
COPY . .

# Build for production.
RUN sudo npm run build

# Tell Docker about the port we'll run on.
EXPOSE 5000