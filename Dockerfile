FROM tomcat:latest

LABEL maintainer="Zeeshan Ali"

EXPOSE 8080

CMD ["catalina.sh", "run"]
