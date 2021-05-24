# Image to use
FROM ubuntu:20.04

# setting up time-zone data
RUN apt-get update 1> /dev/null
RUN apt-get install tzdata
RUN ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# installing required application
RUN apt-get install apache2 libapache2-mod-wsgi-py3 -y 
RUN apt-get install python3 python3-pip -y

# moving files to appropriate location
RUN mkdir /var/www/html/proj
COPY ./proj/ /var/www/html/proj/
WORKDIR /var/www/html/proj
RUN ls -la;pwd
RUN mv proj.conf /etc/apache2/sites-available/
RUN pip3 install -r requirements.txt
RUN rm requirements.txt
RUN chgrp www-data *
RUN chmod 755 app.py flask.wsgi 
RUN chmod 744 template/index.html

EXPOSE 80
RUN a2dissite 000-default
RUN a2ensite proj.conf
RUN . /etc/apache2/envvars
ENTRYPOINT service apache2 start && tail -F /var/log/apache2/error.log


