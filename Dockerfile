# Use the Node.js Alpine image as the base
FROM node:20-alpine

# Switch to root user to install Docker
USER root

# Install Docker inside the image
RUN apk update && \
    apk add --no-cache \
    docker \
    curl \
    git \
    bash

# Set the working directory
WORKDIR /app

# Copy your application code
COPY . .

# Install application dependencies
RUN npm install

# Build your application
RUN npm run build

# Expose the necessary port
EXPOSE 3000

# Switch back to the node user
USER node

# Start the application
CMD ["npm", "start"]
