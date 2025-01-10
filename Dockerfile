# Use an official Node.js runtime as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install
RUN npm install -g json-server

# Copy the rest of the app files
COPY . .

# Expose the ports for the frontend and backend
EXPOSE 3000 5000

# Install a process manager to run multiple commands
RUN npm install -g concurrently

# Define the command to run both frontend and backend
CMD ["npx", "concurrently", "npx json-server --watch api/db.json --port 3000", "npm run dev"]
