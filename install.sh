#!/bin/bash

if [ -z ${version} ]; then echo "version is unset" && exit 1; fi
if [ -z ${dist} ]; then echo "dist is unset" && exit 1; fi
if [ -z ${CATALINA_HOME} ]; then echo "CATALINA_HOME is unset" && exit 1; fi

echo 'Downloading and replacing plugins'
wget https://github.com/HiromuHota/pentaho-kettle/releases/download/webspoon%2F$version/spoon.war -O ${CATALINA_HOME}/webapps/spoon.war
wget https://github.com/HiromuHota/pdi-platform-utils-plugin/releases/download/webspoon%2F$version/pdi-platform-utils-plugin-$dist.jar -O ${CATALINA_HOME}/plugins/platform-utils-plugin/pdi-platform-utils-plugin-$dist.jar
wget https://github.com/HiromuHota/big-data-plugin/releases/download/webspoon%2F$version/pentaho-big-data-legacy-$dist.jar -O ${CATALINA_HOME}/plugins/pentaho-big-data-plugin/pentaho-big-data-legacy-$dist.jar
wget https://github.com/HiromuHota/big-data-plugin/releases/download/webspoon%2F$version/pentaho-big-data-kettle-plugins-common-ui-$dist.jar -O ${CATALINA_HOME}/system/karaf/system/pentaho/pentaho-big-data-kettle-plugins-common-ui/$dist/pentaho-big-data-kettle-plugins-common-ui-$dist.jar
wget https://github.com/HiromuHota/pentaho-kettle/releases/download/webspoon%2F$version/repositories-plugin-core-$dist.jar -O ${CATALINA_HOME}/system/karaf/system/org/pentaho/repositories-plugin-core/$dist/repositories-plugin-core-$dist.jar
wget https://github.com/HiromuHota/pentaho-kettle/releases/download/webspoon%2F$version/pdi-engine-configuration-ui-$dist.jar -O ${CATALINA_HOME}/system/karaf/system/org/pentaho/pdi-engine-configuration-ui/$dist/pdi-engine-configuration-ui-$dist.jar
wget https://github.com/HiromuHota/pdi-dataservice-server-plugin/releases/download/webspoon%2F$version/pdi-dataservice-server-plugin-$dist.jar -O ${CATALINA_HOME}/system/karaf/system/pentaho/pdi-dataservice-server-plugin/$dist/pdi-dataservice-server-plugin-$dist.jar
wget https://github.com/HiromuHota/marketplace/releases/download/webspoon%2F$version/pentaho-marketplace-di-$dist.jar -O ${CATALINA_HOME}/system/karaf/system/org/pentaho/pentaho-marketplace-di/$dist/pentaho-marketplace-di-$dist.jar

echo 'Configuring org.pentaho.requirejs.cfg'
echo 'context.root=/spoon/osgi' | tee ${CATALINA_HOME}/system/karaf/etc/org.pentaho.requirejs.cfg

echo 'Removing Karaf cache'
rm -rf ${CATALINA_HOME}/system/karaf/caches/webspoonservletcontextlistener || true
