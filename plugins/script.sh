#!/bin/bash
/bin/bash app-entrypoint.sh nami start --foreground tomcat &
until [ "`curl --silent --show-error -L -I http://localhost:8080 | grep 'jasperserver'`" != "" ];
do
  echo --- sleeping for 20 seconds
  sleep 20
done
echo "jasperserver is up!"
cd /opt/bitnami/tomcat/bin
chmod +x setenv.sh
chmod +x shutdown.sh
/bin/bash shutdown.sh
cp -a /bitnami/jrs/. /bitnami/tomcat/data/jasperserver/WEB-INF/
chmod +x catalina.sh
/bin/bash catalina.sh run