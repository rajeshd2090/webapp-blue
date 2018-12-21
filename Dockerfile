
FROM centos

ENV JAVA_HOME=/opt/jdk1.8.0_45 \
    APP_HOME=/opt

# Create bmc user so our program doesn't run as root.
RUN groupadd -r tomcat-grp && \
    useradd -r -g tomcat-grp -u 786 -d $APP_HOME -s /sbin/nologin -c "Tomcat User" tomcatuser && \
    mkdir -p $APP_HOME && \
    chown -R tomcatuser:tomcat-grp $APP_HOME && \
    echo "tomcatuser:admin123" | chpasswd
USER 786

ADD --chown=tomcatuser:tomcat-grp  t_tomcat /opt/

ADD --chown=tomcatuser:tomcat-grp scripts/* /opt/scripts/

ADD --chown=tomcatuser:tomcat-grp jdk1.8.0_45 /opt/jdk1.8.0_45/

#ENV JAVA_HOME=/opt/jdk1.8.0_45
EXPOSE 8080
CMD [ "sh", "-c", "/opt/scripts/entrypoint.sh" ]
#CMD ['/bin/sh','echo','Hello' ]
