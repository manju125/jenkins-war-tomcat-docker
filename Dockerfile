FROM tomcat:alpine
RUN sed -i 's/port="8080"/port="80"/' /usr/local/tomcat/conf/server.xml
ADD ./target/
CMD ["catalina.sh", "run"]
