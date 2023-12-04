From getmeili/meilisearch:latest
ENV     MEILI_HTTP_ADDR 0.0.0.0:8080
        MEILI_MASTER_KEY=testtestdontcare
        MEILI_NO_ANALYTICS=${MEILI_NO_ANALYTICS:-true}
        MEILI_LOG_LEVEL
        MEILI_DB_PATH=/data
RUN useradd -r -u 1001 -g appuser appuser  &&\
    mkdir /data &&\
    chown 1001 -R /data &&\
    chmod 777 -R /data
expose 8080
user 1001
