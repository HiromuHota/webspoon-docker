FROM tomcat:jre8
MAINTAINER Hiromu Hota <hiromu.hota@hal.hitachi.com>
ARG version=0.8.0.13
RUN rm /etc/java-8-openjdk/accessibility.properties
ADD https://github.com/HiromuHota/pentaho-kettle/releases/download/webspoon%2F$version/spoon.war ${CATALINA_HOME}/webapps/
