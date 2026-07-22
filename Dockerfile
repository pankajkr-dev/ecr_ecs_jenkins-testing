# Use the official Fedora base image
FROM fedora:latest

# Install Apache HTTP Server (httpd)
RUN dnf -y update && \
    dnf -y install httpd && \
    dnf clean all

# Copy the HTML file from your GitHub repo into the Apache web directory
COPY index.html /var/www/html/index.html

# Expose port 80 for web traffic
EXPOSE 80

# Start the Apache service
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]