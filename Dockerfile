# Use Node.js 20.9.0 base image
FROM node:20.9.0-alpine

# Set the working directory inside the container
WORKDIR /app

# Install TypeScript globally
RUN npm install -g typescript

# Copy package.json and yarn.lock to leverage caching of dependencies
COPY package*.json yarn.lock ./

# Install project dependencies
RUN yarn install 

# Copy the rest of your application code into the container
COPY . .

# Compile TypeScript to JavaScript
RUN yarn build

# Expose the port your app runs on
EXPOSE 3000

# Start the application
CMD ["yarn", "start"]
