FROM node:11.3.0-alpine

RUN mkdir -p /usr/local/app

# Create work directory
WORKDIR /usr/local/app

# Copy app source
# NOTE: 'npm install --production' must be run before building this image'
ADD build /usr/local/app

# # Install dependencies
# RUN npm i --production

# # Build for production.
# RUN npm run build

# Install static hosting server
RUN npm install -g serve

# Tell Docker about the port we'll run on.
EXPOSE 3000

# Serve built site
CMD serve -s /usr/local/app -l 3000