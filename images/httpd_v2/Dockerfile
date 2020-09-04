FROM centos:centos7
RUN yum install net-tools -y
RUN yum install httpd -y
RUN yum install which -y
RUN yum install curl -y
RUN yum install bind-utils -y

RUN which httpd
RUN echo "v2" > /var/www/html/index.html
EXPOSE 80 443
ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]

