FROM oraclelinux:8

# Admin pass for DB
ENV DB_PASS="oracledb"
ENV ORACLE_HOME="/opt/oracle/product/21c/dbhomeXE"
ENV ORACLE_SID="XE"
ENV ORAENV_ASK="NO"
ENV USER="dbuser"
ENV PASS="welcome"
 
# Copy files into container
RUN ["mkdir", "-p", "/install"]
COPY "files/oracle-database-xe-21c-1.0-1.ol8.x86_64.rpm" "install"
COPY "files/oracle-database-preinstall-21c.conf" "install"

# Install Oracle Database XE 21c
RUN yum -y localinstall /install/oracle-database-xe-21c-1.0-1.ol8.x86_64.rpm

# Docker fix before configuration
# Ref: https://stackoverflow.com/questions/62574379/su-permission-denied-despite-being-root-in-oracle-container
RUN rm /etc/security/limits.d/oracle-database-preinstall-21c.conf &&\
    cp /install/oracle-database-preinstall-21c.conf /etc/security/limits.d/

# Start configuring DB with default password
COPY "files/oracle-xe-21c.conf" "/etc/sysconfig/oracle-xe-21c.conf"
COPY "files/tnsnames.ora" "$ORACLE_HOME/network/admin/tnsnames.ora"
RUN (echo "$DB_PASS"; echo "$DB_PASS";) | /etc/init.d/oracle-xe-21c configure

RUN curl https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-8 -o /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8 &&\
    rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm &&\
    yum install rlwrap -y

COPY "files/config.sql" "install"
RUN $ORACLE_HOME/bin/sqlplus -S sys/$DB_PASS as sysdba @install/config.sql

RUN echo "source $ORACLE_HOME/bin/oraenv" >> ~/.bashrc &&\
    rm -r install

COPY "files/startup.sh" "startup.sh"
ENTRYPOINT ["bash", "startup.sh"]
