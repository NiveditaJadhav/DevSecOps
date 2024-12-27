# Use a base image compatible with Windows 11 or Windows Server Core
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Set the working directory
WORKDIR /app

# Copy application files
COPY . .

# Install necessary software or packages
RUN powershell -Command \
    Install-WindowsFeature Web-Server

# Expose port (example for web server)
EXPOSE 80

# Run the application (e.g., start a web server or service)
CMD ["powershell", "Start-Process", "powershell", "-ArgumentList", "Start-Service", "W3SVC"]
