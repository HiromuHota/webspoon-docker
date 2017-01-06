FROM tomcat:jre8
MAINTAINER Hiromu Hota <hiromu.hota@hal.hitachi.com>
ADD https://github.com/HiromuHota/pentaho-kettle/releases/download/webspoon%2F0.6.1.4/spoon.war /usr/local/tomcat/webapps/
