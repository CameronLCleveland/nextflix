# Use a lightweight Node.js base image
FROM node:18.0.0-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy all files into the working directory in the container
COPY . .

# Set Node.js to use the legacy OpenSSL provider
ENV NODE_OPTIONS=--openssl-legacy-provider

# Define a build-time variable for the API key
ARG API_KEY

# Set the API key as an environment variable
ENV TMDB_KEY=${API_KEY}

# Install project dependencies
RUN npm install

# Build the project (e.g., for React, Next.js, etc.)
RUN npm run build

# Expose port 3000 for the application
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
