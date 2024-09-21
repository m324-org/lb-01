# Use Node.js 20.9.0 base image
FROM node:20.9.0-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) if present
COPY package*.json ./

# Install dependencies (including dev dependencies for TypeScript compilation)
RUN npm install -g yarn
# Install TypeScript globally
RUN npm install -g typescript

RUN yarn install
# Copy the rest of your application code
COPY . .


# Compile TypeScript to JavaScript
RUN yarn build


# Expose the port your app runs on (modify if different)
EXPOSE 3000

# Start the application (modify based on how you run your app)
CMD ["yarn", "start"]
