# Use the official Apache image
FROM httpd:latest

# Set the working directory
WORKDIR /usr/local/apache2/htdocs

# Install curl and unzip (or other necessary tools based on your file type)
RUN apt-get update && apt-get install -y curl unzip

# Download the file from the specified URL
RUN curl -L https://www.free-css.com/free-css-templates/page296/healet 

# Extract the downloaded file
#RUN unzip healet.zip && rm healet.zip

# Set the command to run when the container starts
CMD ["httpd-foreground"]