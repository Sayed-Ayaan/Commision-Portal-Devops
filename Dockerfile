# Use official Tomcat image with Java runtime
FROM tomcat:10.1-jdk17

# Remove default root webapps to clean up the server
RUN rm -rf /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/examples

# Copy the built WAR file from your local target directory into Tomcat's webapps folder
COPY target/*.war /usr/local/tomcat/webapps/commission-portal.war

# Expose port 8080 for web traffic
EXPOSE 8080

# Start Tomcat server in the foreground
CMD ["catalina.sh", "run"]  