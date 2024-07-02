FROM centos:latest
LABEL devops="Akanksha"
RUN yum install httpd -y
RUN yum install unzip -y
RUN rm -rf /var/www/html/index.html
WORKDIR /var/www/html
ADD https://www.free-css.com/assets/files/free-css-templates/download/page293/photosec.zip /var/www/html
WORKDIR /var/www/html
RUN mv photosec.html/* 
EXPOSE 80
CMD [ "httpd","-DFOREGROUND" ]