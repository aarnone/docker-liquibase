#!/bin/bash

export LIQUIBASE_HOME=/opt/liquibase
export URL=jdbc:mysql://${DB_PORT_3306_TCP_ADDR}:${DB_PORT_3306_TCP_PORT}/${DB_ENV_MYSQL_DATABASE}

$LIQUIBASE_HOME/liquibase \
	--classpath=/opt/jdbc-drivers/mysql-connector-java.jar \
	--driver=com.mysql.jdbc.Driver \
	--url=$URL \
	--username=$DB_ENV_MYSQL_USER \
	--password=$DB_ENV_MYSQL_PASSWORD \
	--changeLogFile=/data/changelog.xml \
	$@