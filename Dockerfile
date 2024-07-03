FROM ubuntu

# Install necessary packages
RUN apt-get update && apt-get install -y apache2 wget unzip

# Download the template
RUN wget -O /var/www/html/oxer.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip

# Change to the web root directory and unzip the template
WORKDIR /var/www/html/
RUN unzip oxer.zip && \
    mv oxer-html/* . && \
    rm -rvf oxer-html oxer.zip

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]