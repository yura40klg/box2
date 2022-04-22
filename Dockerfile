FROM alpine
RUN apk update \
    && apk add openjdk11 \
    && apk add  wget \
    && mkdir /usr/local/tomcat9 \
    && cd /usr/local \
    && wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz \
    && tar xvfz /usr/local/apache-tomcat-9.0.62.tar.gz -C /usr/local/ \
    && cp -Rv /usr/local/apache-tomcat-9.0.62/* /usr/local/tomcat9/ 
ADD /target/hello-1.0.war /usr/local/tomcat9/webapps/
EXPOSE 8080
CMD ["/usr/local/tomcat9/bin/catalina.sh", "run"]
