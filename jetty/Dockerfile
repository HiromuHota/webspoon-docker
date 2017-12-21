FROM jetty:jre8
MAINTAINER Hiromu Hota <hiromu.hota@hal.hitachi.com>
ARG version=0.8.0.13
USER root
RUN mkdir /home/jetty && chown jetty:jetty /home/jetty
ADD https://github.com/HiromuHota/pentaho-kettle/releases/download/webspoon%2F$version/spoon.war ${JETTY_BASE}/webapps/
RUN chown jetty:jetty ${JETTY_BASE}/webapps/spoon.war
USER jetty
