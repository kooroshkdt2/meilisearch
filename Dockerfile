From registry.access.redhat.com/ubi9/s2i-base:1-481
ENV     MEILI_HTTP_ADDR 0.0.0.0:8080
ENV     MEILI_MASTER_KEY=testtestdontcare
ENV     MEILI_DB_PATH=/opt/app-root/src/db
RUN yum install wget -y   &&\
    yum clean all
RUN wget https://github.com/meilisearch/meilisearch/releases/download/v1.5.0/meilisearch-linux-amd64 -O /usr/local/bin/meilisearch  &&\
    mkdir /opt/app-root/src/db  &&\
    chown 1001 -R /opt/app-root/src  /usr/local/bin/meilisearch &&\
    chmod 777   -R /opt/app-root/src  /usr/local/bin/meilisearch &&\
    chmod +x /usr/local/bin/meilisearch  &&\
    echo '#!/bin/bash' > /usr/local/bin/start.sh &&\
    echo 'echo "we are trying to start service"' >> /usr/local/bin/start.sh &&\
    echo '/usr/local/bin/meilisearch' >> /usr/local/bin/start.sh &&\
    chmod 777 /usr/local/bin/meilisearch /usr/local/bin/start.sh &&\
    chmod +x /usr/local/bin/start.sh /usr/local/bin/meilisearch
expose 8080
user 1001
ENTRYPOINT /usr/local/bin/start.sh
CMD /usr/local/bin/start.sh
