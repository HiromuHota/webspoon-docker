FROM tomcat:jre8
MAINTAINER Hiromu Hota <hiromu.hota@hal.hitachi.com>
ENV tomcat /usr/local/tomcat
ARG version=0.7.0.9
ADD https://github.com/HiromuHota/pentaho-kettle/releases/download/webspoon%2F$version/spoon.war ${tomcat}/webapps/
