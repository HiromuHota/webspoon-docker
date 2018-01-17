FROM tomcat:jre8
MAINTAINER Hiromu Hota <hiromu.hota@hal.hitachi.com>
ENV JAVA_OPTS="-Xms1024m -Xmx2048m"
RUN rm /etc/java-8-openjdk/accessibility.properties
RUN rm -rf ${CATALINA_HOME}/webapps/* \
    && mkdir ${CATALINA_HOME}/webapps/ROOT \
    && echo "<% response.sendRedirect(\"spoon\"); %>" > ${CATALINA_HOME}/webapps/ROOT/index.jsp

ARG version=0.8.0.13
ADD https://github.com/HiromuHota/pentaho-kettle/releases/download/webspoon%2F$version/spoon.war ${CATALINA_HOME}/webapps/
