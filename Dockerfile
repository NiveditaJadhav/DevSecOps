FROM node:14

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json first (for better caching during builds)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all other files from the project to the container
COPY . .

# Expose the necessary port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
