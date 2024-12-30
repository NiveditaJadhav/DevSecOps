# Use OpenJDK 17 (Debian-based) image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Install Node.js and npm (using NodeSource repository)
RUN apt-get update && apt-get install -y wget curl \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash \
    && apt-get install -y nodejs

# Copy application files
COPY . .

# Install Node.js dependencies
RUN npm install

# Expose the required ports
EXPOSE 3000 9090

# Run both the application and ZAP server
CMD ["sh", "-c", "npm start & java -jar /app/zap-2.15.0.jar -daemon -port 9090 -host localhost"]
