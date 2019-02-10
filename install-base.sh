#!/bin/sh

if [ -z ${dist} ]; then echo "dist is unset" && exit 1; fi

# simple-jndi
# LICENSE.txt
# system/
wget -q https://nexus.pentaho.org/repository/proxy-pentaho-public-release-group/org/pentaho/di/pdi-static/$dist/pdi-static-$dist.zip || exit $?
unzip -q pdi-static-$dist.zip system/* simple-jndi/* LICENSE.txt
mv LICENSE.txt webSpoon-LICENSE.txt
rm pdi-static-$dist.zip

echo 'system/karaf'
wget -q https://nexus.pentaho.org/repository/proxy-pentaho-public-release-group/pentaho/pentaho-karaf-assembly/$dist/pentaho-karaf-assembly-$dist-client.zip || exit $?
unzip -q pentaho-karaf-assembly-$dist-client.zip
mv pentaho-karaf-assembly system/karaf
rm pentaho-karaf-assembly-$dist-client.zip

echo 'plugins'
wget -q https://nexus.pentaho.org/repository/omni/org/pentaho/di/pdi-plugins/$dist/pdi-plugins-$dist.zip || exit $?
unzip -q pdi-plugins-$dist.zip
rm pdi-plugins-$dist.zip

echo 'samples'
wget -q https://nexus.pentaho.org/repository/proxy-pentaho-public-release-group/org/pentaho/di/pdi-samples/$dist/pdi-samples-$dist.zip || exit $?
unzip -q pdi-samples-$dist.zip
rm pdi-samples-$dist.zip
