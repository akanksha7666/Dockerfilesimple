FROM Ubuntu:latest
LABEL devops="Akanksha"
RUN apt-get update 
RUN apt-get install -y apache2 
RUN apt-get install -y unzip
RUN rm -rf /var/www/html/index.html
WORKDIR /var/www/html
ADD https://www.free-css.com/assets/files/free-css-templates/download/page293/photosec.zip /var/www/html
RUN unzip photosec.zip
WORKDIR /var/www/html
RUN mv photosec.html/* . 
EXPOSE 80
CMD [ "apache2ctl","-D","FOREGROUND" ]