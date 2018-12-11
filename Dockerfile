FROM circleci/node:11.3.0-stretch

# The base node image sets a very verbose log level.
ENV NPM_CONFIG_LOGLEVEL warn

# Copy all local files into the image.
COPY . .

# Build for production.
RUN sudo npm run build

# Tell Docker about the port we'll run on.
EXPOSE 5000