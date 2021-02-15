FROM bitnami/jasperreports:7.8.0
ADD /plugins/. /bitnami/
ENTRYPOINT [ "/bin/bash", "/bitnami/script.sh" ]
