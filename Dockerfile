FROM registry.fedoraproject.org/fedora:latest
MAINTAINER spurxtreme.com
LABEL Remarks"This is a mariaDB dockerfile running on Fedora"
COPY setup.sh /scripts/

RUN echo "********** Update System *****************" && \
        dnf -y update

RUN echo "********** Install Apps *******************" && \
        dnf install -y hostname mariadb-server

RUN echo "********** Clean UP ***********************" && \
 dnf clean all

RUN echo "********** App Specific commands ***********"
RUN /usr/bin/mysql_install_db
RUN chmod +x /scripts/setup.sh
RUN sh /scripts/setup.sh
#RUN /usr/bin/mysql_secure_installation
VOLUME ["/var/lib/mysql/", "/etc/my.cnf.d/", "/etc/my.cnf"]
EXPOSE 3306
CMD ["/usr/bin/mysqld_safe"]
