FROM centos:centos7
RUN yum install net-tools -y
RUN yum install httpd -y
RUN yum install which -y
RUN yum install curl -y
RUN yum install bind-utils -y
RUN cp -a /etc/httpd/conf/httpd.conf  /etc/httpd/conf/httpd.conf.default
RUN sed -i 's/Listen 80/Listen 8001/' /etc/httpd/conf/httpd.conf
RUN which httpd
RUN echo "v3" > /var/www/html/index.html
EXPOSE 8001
ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]

