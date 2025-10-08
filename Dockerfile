FROM ghcr.io/cirruslabs/flutter:3.35.5 AS flutter-build

WORKDIR /app
COPY . .
RUN flutter pub get
RUN flutter build web --base-href /myapp/

# Create WEB-INF and web.xml for SPA routing
RUN mkdir -p /app/build/web/WEB-INF
RUN echo '<web-app>\n\
  <welcome-file-list>\n\
    <welcome-file>index.html</welcome-file>\n\
  </welcome-file-list>\n\
  <error-page>\n\
    <error-code>404</error-code>\n\
    <location>/index.html</location>\n\
  </error-page>\n\
</web-app>' > /app/build/web/WEB-INF/web.xml

# Package into WAR
RUN cd /app/build/web && \
    zip -r /app/myapp.war .

FROM jboss/wildfly:latest

# Deploy WAR
COPY --from=flutter-build /app/myapp.war /opt/jboss/wildfly/standalone/deployments/myapp.war

EXPOSE 8080
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
