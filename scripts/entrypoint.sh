#! /bin/bash

echo "Starting tomcat"

cd /opt
ls -l

cd /opt/jdk1.8.0_45
ls -l


/opt/apache-tomcat-8.5.37/bin/catalina.sh run

echo "Tomcat started"
