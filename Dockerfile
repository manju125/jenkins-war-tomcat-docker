FROM tomcat:alpine
RUN sed -i 's/port="8080"/port="80"/' /usr/local/tomcat/conf/server.xml
ADD ./target/Project1.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
