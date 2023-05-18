# Use the official Node.js image as the base
FROM docker.io/library/node:16.10-alpine


# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json ./
COPY package-lock.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application
COPY . .

# Set environment variables
ENV NODE_ENV=production

# Build the application
RUN npm run build

# Remove development dependencies
RUN npm prune --production

# Expose the port the app will run on
EXPOSE 4000

# Start the application
CMD ["npm", "start"]
