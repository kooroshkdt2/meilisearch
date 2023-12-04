From getmeili/meilisearch:latest
ENV     MEILI_HTTP_ADDR 0.0.0.0:8080
ENV     MEILI_MASTER_KEY=testtestdontcare
ENV     MEILI_DB_PATH=/meili_data/
RUN addgroup -S appgroup -g 1001 && adduser -S appuser -u 1001  -G root -G appgroup &&\
    chown 1001 -R /meili_data  /bin/meilisearch /bin/meilitool /meilisearch &&\
    chmod +x /bin/meilisearch /bin/meilitool /meilisearch
    echo '#!/bin/sh' > /usr/local/bin/start.sh &&\
    echo '/bin/meilisearch' >> /usr/local/bin/start.sh &&\
    chmod +x /usr/local/bin/start.sh /bin/meilisearch /meilisearch
expose 8080
user 1001
ENTRYPOINT /usr/local/bin/start.sh
