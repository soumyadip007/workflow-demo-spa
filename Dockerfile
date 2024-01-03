# Use the official Node.js image as the base
FROM node:18-alpine3.16

ARG TESTWORKFLOW
ARG DEMOWORKFLOW
ARG USERGROUP

RUN addgroup allusers && adduser -S -G allusers $USERGROUP
RUN mkdir /.npm
RUN mkdir /.npm/_cacache

RUN echo "Build argument value of TESTWORKFLOW : ${TESTWORKFLOW}"
RUN echo "Build argument value of DEMOWORKFLOW : ${DEMOWORKFLOW}"
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

RUN chown -R $USERGROUP:allusers .
RUN chown -R $USERGROUP:allusers ~/.npm
RUN chown -R $USERGROUP:allusers /.npm
RUN chmod -R 777 .
EXPOSE 3000
USER $USERGROUP

# Start the application
CMD ["npm", "start"]
