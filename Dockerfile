FROM tomcat:jre8
MAINTAINER Hiromu Hota <hiromu.hota@hal.hitachi.com>
ARG version
ADD https://github.com/HiromuHota/pentaho-kettle/releases/download/webspoon%2F$version/spoon.war /usr/local/tomcat/webapps/
