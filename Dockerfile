ARG KAFKA_VERSION=2.8.1
FROM bitnami/kafka:$KAFKA_VERSION
USER root
RUN install_packages gettext

ADD ./mm2.template /opt/mirrormaker/mm2.template
ADD ./run.sh /opt/mirrormaker/run.sh
RUN chmod +x /opt/mirrormaker/run.sh

RUN mkdir -p /var/run/mirrormaker
RUN chown 1234 /var/run/mirrormaker

ENV TOPICS .*
ENV DESTINATION "source-cluster:9092"
ENV SOURCE "localhost:9092"
ENV REPLICATION_FACTOR 1
ENV ACLS_ENABLED "false"
ENV TASKS_MAX 10
ENV KAFKA_CFG_LISTENERS: ""

USER 1234
CMD /opt/mirrormaker/run.sh
