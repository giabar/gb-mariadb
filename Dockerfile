FROM centos:7.5.1804
LABEL maintainer="GiaBar <giabar@giabar.com>"
ADD mariadb.repo /etc/yum.repos.d/mariadb.repo
ADD mariadb.cnf /etc/my.cnf.d/mariadb.cnf
ADD start.sh /start.sh
RUN yum clean all &&\
    rm -rf /var/tmp/ &&\
    rm -rf /var/cache/yum &&\
    yum -y install mariadb-server bind-utils pwgen psmisc net-tools hostname zip unzip &&\
    yum clean all &&\
    rm -rf /var/tmp/ &&\
    rm -rf /var/cache/yum &&\
    chmod +x /start.sh
EXPOSE 3306
VOLUME /var/lib/mysql
VOLUME /var/log/mariadb
CMD ["/start.sh"]
