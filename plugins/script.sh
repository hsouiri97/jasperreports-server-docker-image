/bin/bash app-entrypoint.sh nami start --foreground tomcat &
sleep $1
cd /opt/bitnami/tomcat/bin
chmod +x setenv.sh
chmod +x shutdown.sh
/bin/bash shutdown.sh
cp -a /bitnami/jrs/. /bitnami/tomcat/data/jasperserver/WEB-INF/
chmod +x catalina.sh
/bin/bash catalina.sh run