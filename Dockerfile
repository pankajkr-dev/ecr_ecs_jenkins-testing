# Use the official Fedora base image
FROM fedora:latest

# Install Apache HTTP Server (httpd) and clean up the package cache
RUN dnf -y update && \
    dnf -y install httpd && \
    dnf clean all

# Write the custom message to the default index.html page
RUN echo "Hello from AWS ecr" > /var/www/html/index.html

# Expose port 80 for web traffic
EXPOSE 80

# Start the Apache service in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
