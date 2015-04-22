FROM dockerfile/java

MAINTAINER Alessandro Arnone <arnone.alessandro@gmail.com>

RUN mkdir -p /opt/liquibase && mkdir -p /opt/jdbc-drivers

RUN curl -L http://sourceforge.net/projects/liquibase/files/Liquibase%20Core/liquibase-3.3.2-bin.tar.gz/download -o /tmp/liquibase.tar.gz
RUN curl -L http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.35/mysql-connector-java-5.1.35.jar -o /opt/jdbc-drivers/mysql-connector-java.jar

RUN tar -xzf /tmp/liquibase.tar.gz -C /opt/liquibase \
	&& chmod +x /opt/liquibase/liquibase \
	&& rm -rf /tmp/liquibase.tar.gz


ADD run-liquibase.sh /opt/

RUN chmod +x /opt/run-liquibase.sh

ENTRYPOINT ["/opt/run-liquibase.sh"]