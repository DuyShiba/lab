# Sử dụng Tomcat với JDK 17
FROM tomcat:10.1-jdk17

# Xóa webapps mặc định nếu muốn
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR từ target vào Tomcat (ROOT.war để chạy trên /)
COPY target/lab1-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose port cho Render
EXPOSE 8080

# Lệnh chạy Tomcat
CMD ["catalina.sh", "run"]
