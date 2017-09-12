FROM  debian:stretch
MAINTAINER Nicolas SERY

#update & upgrade
RUN apt-get update; apt-get autoclean
RUN apt-get -y upgrade; apt-get autoclean

#install packages
RUN apt-get install -y systemd; apt-get autoclean
RUN apt-get install -y openssh-server; apt-get autoclean
RUN apt-get install -y vim; apt-get autoclean
RUN apt-get install -y php7.0; apt-get autoclean
RUN apt-get install -y php7.0-mysql; apt-get autoclean
RUN apt-get install -y php7.0-zip; apt-get autoclean
RUN apt-get install -y libapache2-mod-php7.0; apt-get autoclean
#RUN apt-get install -y ; apt-get autoclean

#add script(s)
ADD scripts/ /tmp/scripts/

#config apache2
RUN sed -i -e 's/;   extension=msql.so/extension=msql.so/' /etc/php/7.0/apache2/php.ini
