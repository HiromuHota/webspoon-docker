FROM tomcat:jre8
MAINTAINER Hiromu Hota <hiromu.hota@hal.hitachi.com>
ENV JAVA_OPTS="-Xms1024m -Xmx2048m"
RUN rm /etc/java-8-openjdk/accessibility.properties
RUN rm -rf ${CATALINA_HOME}/webapps/* \
    && mkdir ${CATALINA_HOME}/webapps/ROOT \
    && echo "<% response.sendRedirect(\"spoon\"); %>" > ${CATALINA_HOME}/webapps/ROOT/index.jsp

ARG base=8.2
ARG patch=18
ARG version=0.$base.$patch
ARG dist=8.2.0.0-342

RUN wget https://sourceforge.net/projects/pentaho/files/Pentaho%20$base/client-tools/pdi-ce-$dist.zip && \
  unzip pdi-ce-$dist.zip && \
  mv data-integration/system ${CATALINA_HOME}/system && \
  mv data-integration/plugins ${CATALINA_HOME}/plugins && \
  mv data-integration/simple-jndi ${CATALINA_HOME}/simple-jndi && \
  mv data-integration/samples ${CATALINA_HOME}/samples && \
  mv data-integration/LICENSE.txt ${CATALINA_HOME}/webSpoon-LICENSE.txt && \
  rm pdi-ce-$dist.zip && \
  rm -rf data-integration

RUN echo "org.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true" | tee -a conf/catalina.properties
COPY install.sh /tmp/install.sh
RUN sh /tmp/install.sh

ADD https://github.com/HiromuHota/pentaho-kettle/releases/download/webspoon%2F$version/webspoon-security-$dist-$patch.jar ${CATALINA_HOME}/lib/
RUN echo "CLASSPATH="$CATALINA_HOME"/lib/webspoon-security-$dist-$patch.jar" | tee ${CATALINA_HOME}/bin/setenv.sh
COPY catalina.policy ${CATALINA_HOME}/conf/
RUN mkdir -p $HOME/.kettle/users && mkdir -p $HOME/.pentaho/users
RUN mkdir -p $HOME/.kettle/data && cp -r ${CATALINA_HOME}/samples $HOME/.kettle/data/samples
