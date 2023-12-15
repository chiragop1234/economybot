# Use Ubuntu 18.04 as the base image
FROM ubuntu:18.04

# Update package list and install necessary dependencies
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port your bot will run on (adjust as needed)
EXPOSE 3000

# Command to run your application
CMD ["node", "index.js"]
